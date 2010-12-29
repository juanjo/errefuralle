class Role < ActiveRecord::Base
  
  ADMIN      = 1
  EDITOR     = 2
  REGISTERED = 3
  
  has_and_belongs_to_many :users
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
