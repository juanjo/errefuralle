require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class CountryTest < ActiveSupport::TestCase
  subject { Factory(:country) }

  should have_many(:job_offers)

  should validate_presence_of   :isonum
  should validate_uniqueness_of :isonum

  should validate_presence_of   :iso2
  should validate_uniqueness_of :iso2

  should validate_presence_of   :iso3
  should validate_uniqueness_of :iso3

  should validate_presence_of   :name
  should validate_uniqueness_of :name


end
