class Snippet < ActiveRecord::Base  
  belongs_to :user

  before_save :count_lines
  after_create :publish_directly
  
  validates_presence_of :title, :code
  validates_uniqueness_of :title
  validates_length_of :title, :within => 4..255

  has_friendly_id :title, :use_slug => true, :approximate_ascii => true

  # State Machine
  # #######################################
  state_machine :state, :initial => :pending do

    event :publish do
      transition [:pending, :cancelled, :expired] => :published
    end

    event :cancel do
      transition [:pending, :published] => :cancelled
    end

    event :expire do
      transition [:published] => :expired
    end

    state :published, :cancelled, :expired
  end

  private

    # TODO: For now everyone can post snippets
    def publish_directly
      publish!
    end

    def count_lines
      self.lines = self.code.split(/\n/).size
    end

end
