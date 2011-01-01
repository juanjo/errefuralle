class AddTelecommuteToJobOffers < ActiveRecord::Migration
  def self.up
    add_column :job_offers, :telecommute, :boolean, :default => false    
  end

  def self.down
    remove_column :job_offers, :telecommute
  end
end
