class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if User.find_by(:email => user_params[:email])
            redirect_to root_path, :notice => "User already exists, please log in."
        else
            user = User.new(user_params)
            if user.save
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to root_path, :notice => "All fields are required to sign up, please try again."
            end
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
    end

    def edit
        @user = User.find_by(:id => params[:id])
    end

    def update
        #byebug
        @user = User.find_by(:id => params[:id])
        if @user.update(user_params)
            redirect_to user_user_qualifications_path(current_user)
        else
            redirect_to user_user_qualifications_path(current_user), :notice => "Oops, something went wrong. Please try again."
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :qualification_ids => [ ], :qualifications_attributes => [:description])
    end

end
