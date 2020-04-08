class OpportunitiesController < ApplicationController

    def new
        @opportunity = Opportunity.new
    end

    def create
        @opportunity = current_user.opportunities.build(opportunity_params)
        if @opportunity.save
            redirect_to user_path(current_user)
        else
            redirect_to new_user_opportunity_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def edit
        @opportunity = Opportunity.find_by(:id => params[:id])
    end

    def update
        @opportunity = Opportunity.find_by(:id => params[:id])
        if @opportunity.update(opportunity_params)
            redirect_to user_path(current_user)
        else
            render :edit, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def destroy
        @opportunity = Opportunity.find_by(:id => params[:id])
        @opportunity.delete
        redirect_to user_path(current_user)
    end

    private

    def opportunity_params
        params.require(:opportunity).permit(:title, :company, :location, :contact, :phone, :email, :job_listing, :closed, :user_id)
    end


end
