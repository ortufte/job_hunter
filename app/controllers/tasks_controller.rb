class TasksController < ApplicationController

    def destroy
        @task = Task.find_by(:id => params[:id])
        @task.delete
        redirect_to "/users/#{current_user.id}/opportunities"
    end

end
