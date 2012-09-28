class PracticeArea < ActiveRecord::Base
  paginates_per 5
  attr_accessible :name
  validates :name, :presence => true
  validates_length_of :name, :maximum => 20
  validates_uniqueness_of :name
end
