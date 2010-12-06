class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_uniqueness_of :name
  validates_presence_of :name

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
