class JobOffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_type

  validates_presence_of :title, :description, :company
  validates_length_of :title, :within => 4..255
  validates_length_of :company, :within => 1..255

  after_create :publish_directly
  before_save :convert_details


  # State Machine
  # #######################################
  state_machine :state, :initial => :pending do

    after_transition :on => :publish, :do => :send_email_to_user
    after_transition :on => :cancel, :do => :send_email_to_user

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

    def send_email_to_user
      # TODO
    end

    def publish_directly
      publish! if self.user.can? :manage, self
    end

    def convert_details
      return if self.description.nil?
      self.description_html = Moredown.text_to_html(self.description)
    end
end
