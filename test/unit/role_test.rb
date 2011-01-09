require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class RoleTest < ActiveSupport::TestCase
  subject { Factory(:role) }

  should have_and_belong_to_many :users

  should validate_presence_of   :name
  should validate_uniqueness_of :name

  context 'basics' do
    setup do
    end
    
    should "return the role it is asked for" do
      role = Factory(:role, :name => Role::ROLES[:admin])
      assert_equal( role, Role[:admin] )
    end
    
    should "create and return the role it is asked for" do
      role = nil
      assert_difference "Role.count", 1 do
        role = Role[:admin]
      end
      assert_equal( Role.last, role )
    end
    
    should "raise an error if the role asked for is not defined" do
      assert_difference "Role.count", 0 do
        assert_raise(ArgumentError) do
          Role[:not_defined]
        end
      end
    end
  end

end
