class OffersController < ApplicationController
    def index
        @offers1 = Offer.where(user_id:current_user.id)
        @snkrs = Snkr.where(user_id:current_user.id)
        @offers2 = Offer.where(snkr_id:@snkrs)
        
    end

    def new
        @offers = Offer.new
        @snkrs = Snkr.find(params[:snkr_id]) 
        @offers.images.build      
    end

    def create
        @offer = Offer.new(offers_params)

        @offer.snkr_id = Snkr.find(params[:snkr_id]).id
        @offer.user_id = current_user.id
       if @offer.save!
            if params[:images].present?
                params[:images]["image"].each do |img|
                    @images = @offer.images.create(:image => img, :offer_id => @offer.id)
                end
            end
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
        @snkr_image = Image.where(snkr_id:@snkrs.id)
        @offer_image = Image.where(offer_id:@offers.id)

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
        @snkrs = Snkr.find(params[:snkr_id])
        @offers = Offer.find(params[:id])
        if @offers.update(offers_params)
<<<<<<< HEAD
            @offers.create_notification_update!(current_user)
=======
            @offers.create_notification_by(current_user)
>>>>>>> origin/master
            if @offers.consent == 'はい'
                redirect_to :action => "edit", :snkr_id => @snkrs.id, :id => @offers.id
            else @offers.consent == 'いいえ'
                redirect_to :action => "index", :snkr_id => @snkrs.id
            end
        else
            redirect_to :action => "edit", :snkr_id => @snkrs.id, :id => @offers.id
        end
    end

    private
        def offers_params
            params.require(:offer).permit(:name, :score, :retailer, :usage, :size, :image, :consent, images_attributes: [:image])
          
        end

end
