class SessionsController < ApplicationController

    def new        
    end

    def create
        user = User.find_by(name: session_params[:name])     
        if user && user.authenticate(session_params[:password]) then
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:notice] = "Inavlid Login"
            redirect_to "/login"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

    private 

    def session_params
        params.require(:user).permit(:name, :password)
    end

end