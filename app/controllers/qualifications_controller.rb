class QualificationsController < ApplicationController

    def index
        @qualifications = Qualification.all 
    end
    
    def new
        @qualification = Qualification.new
    end

    def create
        qualification = Qualification.find_or_create_by(:description => params[:qualification][:description])
        if qualification.save
            redirect_to qualifications_path
        else 
            redirect_to new_qualification_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    private

    def qualification_params
        params.require(:qualification).permit(:description, :user_ids => [ ])
    end

end
