class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
    end

    def edit
        @user = User.find_by(:id => params[:id])
    end

    def update
        @user = User.find_by(:id => params[:id])
        if @user.update(:qualification_ids => user_params[:qualification_ids])
            redirect_to user_user_qualifications_path(current_user)
        else
            redirect_to user_user_qualifications_path(current_user), :notice => "Oops, something went wrong. Please try again."
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :qualification_ids => [ ], :qualification_attributes => [:description])
    end

end
