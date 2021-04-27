class LikesController < ApplicationController

  def index
     
  end

  def create
    like = current_user.likes.create(snkr_id: params[:snkr_id]) #user_idとsnkr_idの二つを代入
    redirect_back(fallback_location: root_path)

    snkr = Snkr.find(params[:id])
    snkr.create_notification_like!(current_user)
  end
    
  def destroy
    like = Like.find_by(snkr_id: params[:snkr_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
