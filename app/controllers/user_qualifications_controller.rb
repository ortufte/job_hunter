class UserQualificationsController < ApplicationController

    def index
       
    end

    private

    def user_qualification_params
        params.require(:user_qualification).permit(:user_id, :qualification_id, :comment)
    end

end
