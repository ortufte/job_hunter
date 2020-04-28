class OpportunitiesController < ApplicationController

    def index
        @opportunities = Opportunity.all
    end

    def new
        @opportunity = Opportunity.new #current_user.opportunities.build NO PARAMS
    end

    def create
        @opportunity = current_user.opportunities.build(opportunity_params)
        if @opportunity.save
            redirect_to "/users/#{current_user.id}/opportunities/#{@opportunity.id}"
        else
            redirect_to new_user_opportunity_path, :notice => "Oops, something went wrong. Please try again."
        end
    end

    def show
        @opportunity = Opportunity.find_by(:id => params[:id])
    end


    def edit
        @opportunity = Opportunity.find_by(:id => params[:id])
    end

    def update
        @opportunity = Opportunity.find_by(:id => params[:id])
        #byebug
        if @opportunity.update(opportunity_params)
            redirect_to user_opportunity_path(@opportunity)
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
        params.require(:opportunity).permit(:title, :company, :location, :contact, :phone, :email, :job_listing, :closed, :user_id, :qualification_ids => [ ], :qualifications_attributes => [:description])
    end


end
