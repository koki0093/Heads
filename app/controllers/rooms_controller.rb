class RoomsController < ApplicationController
    before_action :authenticate_user!

<<<<<<< HEAD
  def index
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end
=======
    def index
      @user = User.find(current_user.id)
      @rooms = @user.rooms
      
    end
>>>>>>> origin/master

  def create
    @room = Room.create(snkr_id: params[:snkr_id], offer_id: params[:offer_id])
    
    @snkrs = Snkr.find(params[:snkr_id])
    @offers = Offer.find(params[:offer_id])
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    
    redirect_to :action => "show", :snkr_id => @snkrs.id, :id => @offers.id, :id =>@room.id
  end

  def show
    @snkrs = Snkr.find(params[:snkr_id])
    @offers = Offer.find(params[:offer_id])
    @room = Room.find(params[:id])
    @snkrsUser = User.find(@snkrs.user_id)
    @offerUser = User.find(@offers.user_id)


    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
