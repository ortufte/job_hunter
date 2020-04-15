class UserQualificationsController < ApplicationController

    def index
       
    end

    def new
        @user = current_user
        #byebug
        3.times do
            u = @user.user_qualifications.build
            u.build_qualification
        end
    end

    def create
        #byebug
        @user_qualification = UserQualification.new(user_qualification_params)
        byebug
        if @user_qualification.save
            redirect_to user_user_qualifications_path
        else
            redirect_to new_user_user_qualification_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def edit
        @user_qualification = UserQualification.find_by(:id => params[:id])
    end

    def update
        @user_qualification = UserQualification.find_by(:id => params[:id])
        if @user_qualification.update(user_qualification_params)
            redirect_to user_user_qualifications_path
        else
            redirect_to edit_user_user_qualification_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def destroy
        @user_qualification = UserQualification.find_by(:id => params[:id])
        @user_qualification.delete
        redirect_to user_user_qualifications_path
    end


    private

    def user_qualification_params
        params.require(:user_qualification).permit(:user_id, :qualification_id, :comment)
    end

end
