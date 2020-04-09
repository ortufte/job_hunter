class CreateUserQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_qualifications do |t|
      t.string :comment
      t.integer :user_id
      t.integer :qualification_id
      
      t.timestamps
    end
  end
end
