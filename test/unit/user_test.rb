require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class UserTest < ActiveSupport::TestCase
  subject { Factory(:user) }

  should have_and_belong_to_many :roles
  should have_many :snippets
  should have_many :job_offers
  should have_many :posts

  should validate_presence_of   :username
  should validate_uniqueness_of :username
  should ensure_length_of(:username).is_at_least(2).is_at_most(10)
  
  context 'basics' do
    setup do
    end

    should 'add registered role after create' do
      user = Factory.build(:user)
      assert_equal([], user.roles)
      
      user.save
      assert_equal([Role[:registered]], user.roles)
    end
    
    should 'scope confirmed' do
      user_confirmed = Factory(:user)
      user_confirmed.confirm!
      user_not_confirmed = Factory(:user)
      
      assert_equal( [user_confirmed], User.confirmed)
    end
    
    should 'scope unconfirmed' do
      user_confirmed = Factory(:user)
      user_confirmed.confirm!
      user_not_confirmed = Factory(:user)
      
      assert_equal( [user_not_confirmed], User.unconfirmed)
    end
    
    should 'return correctly if the user has the role asked or not' do
      user_admin = Factory(:user)
      user_admin.roles << Role[:admin]
      user_not_admin = Factory(:user)
      
      assert( user_admin.role?(:admin) )
      assert( !user_not_admin.role?(:admin) )
    end
    
    should 'return correctly if the user can or not can do something' do
      user_admin = Factory(:user)
      user_admin.roles << Role[:admin]
      user_not_admin = Factory(:user)

      assert( user_admin.can?(:manage, Factory(:job_offer) ) )
      assert( !user_not_admin.can?(:manage, Factory(:job_offer) ) )
    end
  end
end
