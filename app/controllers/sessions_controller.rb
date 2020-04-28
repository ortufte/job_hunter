class SessionsController < ApplicationController

    def new
    end

    def create
        if request.env["omniauth.auth"]
            user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            user = User.find_by(:email => params[:email]) 
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to new_session_path, :notice => "User not found, please try again."
            end
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
    
end
