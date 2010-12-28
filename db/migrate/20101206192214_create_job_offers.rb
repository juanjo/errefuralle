class CreateJobOffers < ActiveRecord::Migration
  def self.up
    create_table :job_offers do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.text :description_html
      t.string :company, :null => false
      t.references :user
      t.references :job_type
      t.string :state, :default => 'pending'

      t.timestamps
    end
  end

  def self.down
    drop_table :job_offers
  end
end
