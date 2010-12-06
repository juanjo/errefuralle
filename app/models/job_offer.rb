class JobOffer < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description

  after_create :publish_directly

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
end

private

  def send_email_to_user
    # TODO
  end

  def publish_directly
    publish! if user.can? :manage, self
  end