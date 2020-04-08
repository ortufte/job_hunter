class QualificationsController < ApplicationController

    def new
    end

    def create
        qualification = Qualification.new(qualification_params)
        if qualification.save
            redirect_to qualifications_path
        else
            redirect_to new_qualification_path 
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def qualification_params
        params.require(:qualification).permit(:description, :user_id)
    end

end
