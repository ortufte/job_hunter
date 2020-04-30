class AddOpportunityIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :opportunity_id, :integer
  end
end
