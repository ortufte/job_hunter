class UserQualificationsController < ApplicationController

    def index  
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



    private

    def user_qualification_params
        params.require(:user_qualification).permit(:user_id, :qualification_id, :comment)
    end

end
