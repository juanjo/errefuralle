class AddCountryToJobOffer < ActiveRecord::Migration
  def self.up
    add_column :job_offers, :country_id, :integer
  end

  def self.down
    remove_column :job_offers, :country_id
  end
end
