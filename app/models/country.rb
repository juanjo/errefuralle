class Country < ActiveRecord::Base
  
  has_many :job_offers

  validates_presence_of :isonum, :iso2, :iso3, :name
  validates_uniqueness_of :isonum, :iso2, :iso3, :name

  validates_length_of :isonum,  :maximum => 6
  validates_length_of :iso2,    :is => 2
  validates_length_of :iso3,    :is => 3
end
