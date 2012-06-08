class Member < ActiveRecord::Base
  attr_accessible :address, :agency, :board_member, :city, :email, :first_name, :home_phone, :last_dues_paid, :last_name, :state, :work_phone, :zip
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true
  validates_length_of :first_name, :maximum => 16
  validates_length_of :last_name, :maximum => 20
  validates_length_of :city, :minimum => 3, :maximum => 20
  validates_length_of :state, :minimum => 2, :maximum => 2
  validates_length_of :zip, :minimum => 5, :maximum => 10
  def full
    "#{first_name} #{last_name}"
  end
end
