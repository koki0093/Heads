class UsersController < ApplicationController
    def show
        @user = User.find(current_user.id)
        @userSnkr = Snkr.where(user_id:@user.id)
    end
end
