class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.integer :isonum,  :null => false
      t.string :iso2,     :null => false, :limit => 2
      t.string :iso3,     :null => false, :limit => 3
      t.string :name,     :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
