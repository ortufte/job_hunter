class SessionsController < ApplicationController

    def new
    end

    def login
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render '/users/show'
        else
            redirect_to '/login', :notice => "User not found, please try again."
        end
    end

    def logout
        reset_session
    end
    
end
