class CreateJobOffers < ActiveRecord::Migration
  def self.up
    create_table :job_offers do |t|
      t.string :title
      t.text :description
      t.references :user
      t.string :state, :default => 'pending'

      t.timestamps
    end
  end

  def self.down
    drop_table :job_offers
  end
end
