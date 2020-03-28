class UsersController < ApplicationController

    def new
    end

    def create
        @user = User.create(user_params)
        if @user.valid? then
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:notice] = "Invalid User Creation Values"
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end