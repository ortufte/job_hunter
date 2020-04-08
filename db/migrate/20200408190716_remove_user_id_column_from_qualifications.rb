class RemoveUserIdColumnFromQualifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :qualifications, :user_id
  end
end
