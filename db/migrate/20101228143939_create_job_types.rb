class CreateJobTypes < ActiveRecord::Migration
  def self.up
    create_table :job_types do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :job_types
  end
end
