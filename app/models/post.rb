class Post < ActiveRecord::Base

  default_scope :order => 'created_at DESC'

  belongs_to :user

  before_save :convert_content

  attr_protected :user_id

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_length_of :title, :within => 4..255

  validates_presence_of :content
  validates_length_of :content, :within => 25..1200


  private

    def convert_content
      self.content_html = Moredown.text_to_html(self.content)
    end
end
