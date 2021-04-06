class OffersController < ApplicationController
    def index
        @offers1 = Offer.where(user_id:current_user.id)
        @snkrs = Snkr.where(user_id:current_user.id)
        @offers2 = Offer.where(snkr_id:@snkrs)
        
    end

    def new
        @offers = Offer.new
        @snkrs = Snkr.find(params[:snkr_id])       
    end

    def create
        offer = Offer.new(offers_params)

        offer.snkr_id = Snkr.find(params[:snkr_id]).id
        offer.user_id = current_user.id
       if offer.save!
           redirect_to :action => "index"
       else
           redirect_to :action => "new"
       end
    end

    def show
        @offers = Offer.find(params[:id])      
    end

    def destroy
        offer = Offer.find(params[:id])
        offer.destroy
        redirect_to action: :index
    end

    def edit
        @offers = Offer.find(params[:id])
        @snkrs = Snkr.find(params[:snkr_id])
        @snkrsUser = User.find(@snkrs.user_id)

        @offersUser = User.find(@offers.user_id)
        @offersUserEntry=Entry.where(user_id: @offersUser.id)
        @currentUserEntry=Entry.where(user_id: current_user.id)
        
        if @offersUser.id == current_user.id
        else
        @currentUserEntry.each do |cu|
            @offersUserEntry.each do |u|
                if cu.room_id == u.room_id then
                    @isRoom = true
                    @roomId = cu.room_id
                end
            end
        end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
    end

    def update
        @offers = Offer.find(params[:id])
        @snkrs = Snkr.find(params[:snkr_id])
        offer = Offer.find(params[:id])
        if offer.update(offers_params)
            if @offers.consent == 'はい'
                flash.now[:alert] = 'はい'
                redirect_to :action => "edit", :snkr_id => @snkrs.id, :id => offer.id
            elsif @offers.consent == 'いいえ'
                flash[:success] = "コメントできませんでした"
                redirect_back(fallback_location: root_path)
                # redirect_to "snkr_offers", :snkr_id => @snkrs.id
            else
                redirect_to "snkrs_path"
            end
        else
            # redirect_to :action => "edit", :snkr_id => @snkrs.id, :id => offer.id
            redirect_back(fallback_location: root_path)
        end
    end

    private
        def offers_params
            params.require(:offer).permit(:name, :score, :retailer, :usage, :size, :image, :consent)
          
        end

end