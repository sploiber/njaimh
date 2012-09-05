class Member < ActiveRecord::Base
  paginates_per 7
  attr_accessible :address, :agency, :board_member, :city, :email, :first_name, :home_phone, :last_dues_paid, :last_name, :state, :work_phone, :zip, :memo
  define_index do
    indexes :last_name, :sortable => true
    indexes :first_name
    indexes :agency
    indexes :address
    set property :enable_star => 1
    set property :min_infix_len => 3
  end
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
  def print_home_phone
    home_phone =~ /\d/ ? "#{home_phone}" : "-"
  end
  def print_work_phone
    work_phone =~ /\d/ ? "#{work_phone}" : "-"
  end
  def print_agency
    agency =~ /\w/ ? "#{agency}" : "-"
  end
  def print_email
    email =~ /\w/ ? "#{email}" : "-"
  end
  def print_address
    address =~ /\w/ ? "#{address}" : "-"
  end
  def print_city
    city =~ /\w/ ? "#{city}" : "-"
  end
  def print_state
    state =~ /\w/ ? "#{state}" : "-"
  end
  def print_last_dues_paid
    last_dues_paid =~ /\w/ ? "#{last_dues_paid}" : "-"
  end
  def print_board_member
    board_member == 1 ? "Y" : "N"
  end
end
