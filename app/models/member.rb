class Member < ActiveRecord::Base
  paginates_per 7
  attr_accessible :address_1, :address_2, :agency, :board_member, :city, :email_1, :email_2, :first_name, :home_phone, :last_dues_paid, :last_name, :state, :work_phone, :zip, :memo, :exec_board_position, :fax_number, :org_member
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
  validate :work_phone_may_not_have_alphas, :home_phone_may_not_have_alphas, :fax_number_may_not_have_alphas, :primary_email_must_have_at_sign, :secondary_email_must_have_at_sign
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
  def print_email_1
    email_1 =~ /\w/ ? "#{email_1}" : "-"
  end
  def print_email_2
    email_2 =~ /\w/ ? "#{email_2}" : "-"
  end
  def print_address_1
    address_1 =~ /\w/ ? "#{address_1}" : "-"
  end
  def print_address_2
    address_2 =~ /\w/ ? "#{address_2}" : "-"
  end
  def print_city
    city =~ /\w/ ? "#{city}" : "-"
  end
  def print_state
    state =~ /\w/ ? "#{state}" : "-"
  end
  def print_last_dues_paid
    last_dues_paid.nil? ? "<no date given>" : "#{last_dues_paid}"
  end
  def print_board_member
    board_member ? "Y" : "N"
  end
  def print_exec_board_position
    exec_board_position =~ /\w/ ? "#{exec_board_position}" : "-"
  end
  def print_fax_number
    fax_number =~ /\d/ ? "#{fax_number}" : "-"
  end
  def print_memo
    memo =~ /\w/ ? "#{memo}" : "-"
  end
  def print_org_member
    org_member ? "Y" : "N"
  end
  def work_phone_may_not_have_alphas
    if work_phone =~ /\w/
      errors.add(:work_phone, "may not have letters")
    end
  end
  def home_phone_may_not_have_alphas
    if home_phone =~ /\w/
      errors.add(:home_phone, "may not have letters")
    end
  end
  def fax_number_may_not_have_alphas
    if fax_number =~ /\w/
      errors.add(:fax_number, "may not have letters")
    end
  end
  def primary_email_must_have_at_sign
    if email_1.length > 0 and email_1 !~ /\@/
      errors.add(:primary_email, "must have \@ sign")
    end
  end
  def secondary_email_must_have_at_sign
    if email_2.length > 0 and email_2 !~ /\@/
      errors.add(:secondary_email, "must have \@ sign")
    end
  end
end
