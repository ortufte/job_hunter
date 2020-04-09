class UserQualificationsController < ApplicationController

    def index
        #a user "profile" page where they can see and edit their qualifications
        #can i use a partial on this page to edit user_qualifications
        @user_qualifications = current_user.user_qualifications
        @qualifications = current_user.qualifications
    end
    
    def new
        @user_qualification = UserQualification.new
    end

    def create
        #upon selection of a qualification, or creation of a new qualification, add it to user qualifications
        user_qualification = UserQualification.new(user_qualification_params)
        if user_qualification.save
            redirect_to user_qualifications_path #user_qualifications#index
        else
            redirect_to new_user_qualification_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def edit
        #a user can update a user qualification by adding a comment to the qualification on their profile page
        @user_qualification = UserQualification.find_by(:id => params[:id])
    end

    def update
        @user_qualification = UserQualification.find_by(:id => params[:id])
        if @user_qualification.update(user_qualification_params)
            redirect_to user_qualifications_path
        else
            redirect_to edit_user_qualification_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def destroy
        @user_qualification = UserQualification.find_by(:id => params[:id])
        @user_qualification.delete
        redirect_to user_qualifications_path
    end


    private

    def user_qualification_params
        params.require(:user_qualification).permit(:comment, :user_id, :qualification_id)
    end

end
