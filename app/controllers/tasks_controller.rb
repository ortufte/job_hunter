class TasksController < ApplicationController
    
    def destroy
        @task = Task.find_by(:id => params[:id])
        @opportunity = @task.opportunity
        @task.delete
        render "/opportunities/show"
    end

end
