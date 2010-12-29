class Post < ActiveRecord::Base
  belongs_to :user
  
  serialize :metadata
  
  attr_protected :user_id
  
  validates_length_of :title, :within => 4..255
  validates_uniqueness_of :name, :if => :name?
  validates_format_of :name, :with => /^[\w\-\_]+$/, :if => :name?, :message => 'is invalid (alphanumerics, hyphens and underscores only)'
  validates_length_of :name, :within => 4..255, :if => :name?
  validates_length_of :content, :within => 25..1200
    
end
