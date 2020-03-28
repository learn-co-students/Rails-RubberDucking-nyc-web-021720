class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @user
    end

    def check_login
        if !session[:user_id].present? then
            redirect_to "/login"
            # return false
        else
            @user = User.find(session[:user_id])
        end
    end
end
