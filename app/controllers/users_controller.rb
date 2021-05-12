class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @userSnkr = Snkr.where(user_id:@user.id)
    end
end
