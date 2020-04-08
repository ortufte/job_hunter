class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :contact
      t.string :phone
      t.string :email
      t.string :job_listing
      t.boolean :closed, :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
