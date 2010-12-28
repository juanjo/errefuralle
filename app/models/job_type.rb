class JobType < ActiveRecord::Base
  
  has_many :job_offers
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
