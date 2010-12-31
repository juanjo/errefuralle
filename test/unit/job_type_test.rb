require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class JobTypeTest < ActiveSupport::TestCase
  subject { Factory(:job_type) }

  should have_many(:job_offers)

  should validate_presence_of   :name
  should validate_uniqueness_of :name
end
