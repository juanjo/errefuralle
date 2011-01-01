require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class JobOfferTest < ActiveSupport::TestCase
  subject { Factory(:job_offer) }

  should belong_to(:user)
  should belong_to(:job_type)
  should belong_to(:country)

  should validate_presence_of   :title
  should validate_uniqueness_of :title
  should ensure_length_of(:title).is_at_least(4).is_at_most(255)

  should validate_presence_of   :description

  should validate_presence_of   :company
  should ensure_length_of(:company).is_at_least(1).is_at_most(255)

  context 'basics' do
    setup do
      @job_offer  = Factory(:job_offer)
      @user       = Factory(:user)
      @user.confirm!

      @admin      = Factory(:role, :name => 'Admin')
      @editor     = Factory(:role, :name => 'Editor')
      @registered = Factory(:role, :name => 'Registered')

      @user.roles << @admin
    end

    context 'state machine' do
      should 'have state pending just created' do
        job_offer = Factory.build(:job_offer, :user => @user)
        assert_equal 'pending', job_offer.state
      end

      should 'have state published after create if the user has the ability' do
        assert_equal 'published', @job_offer.state
      end
    end
  end

end
