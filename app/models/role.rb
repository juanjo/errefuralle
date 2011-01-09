class Role < ActiveRecord::Base
  ROLES = {
    :admin      => 'Admin',
    :editor     => 'Editor',
    :registered => 'Registered'
  }
  
  has_and_belongs_to_many :users
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def self.[](value)
    raise ArgumentError, "Role not available: '#{value}'"  unless ROLES[value]
    Role.find_or_create_by_name(ROLES[value])
  end
end
