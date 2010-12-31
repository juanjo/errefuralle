require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class RoleTest < ActiveSupport::TestCase
  subject { Factory(:role) }

  should have_and_belong_to_many :users

  should validate_presence_of   :name
  should validate_uniqueness_of :name

  context 'basics' do
    setup do
      @role  = Factory(:role)
    end

  end

end
