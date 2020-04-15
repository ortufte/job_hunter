class CreateOpportunityQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunity_qualifications do |t|
      t.integer :opportunity_id
      t.integer :qualification_id

      t.timestamps
    end
  end
end
