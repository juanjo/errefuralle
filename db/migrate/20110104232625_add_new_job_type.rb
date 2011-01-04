class AddNewJobType < ActiveRecord::Migration
  def self.up
    JobType.create(:name => 'Sin especificar')
  end

  def self.down
    job_type = JobType.find_by_name('Sin especificar')
    job_type.destroy if job_type 
  end
end
