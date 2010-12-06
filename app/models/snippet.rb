class Snippet < ActiveRecord::Base
  belongs_to :user

  after_create :publish_directly

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

end
