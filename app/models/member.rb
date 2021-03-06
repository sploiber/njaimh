class Member < ActiveRecord::Base
  paginates_per 12
  belongs_to :practice_area
  belongs_to :endorsement_level
  attr_accessible :address_1, :address_2, :agency, :board_member, :city, :email_1, :email_2, :first_name, :home_phone, :last_name, :state, :work_phone, :zip, :memo, :board_position, :fax_number, :org_member, :county, :dues_paid_year, :org_member_type, :work_extension, :title_credential, :practice_area_id, :secondary_practice_area_id, :endorsement_level_id
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_length_of :first_name, :maximum => 16
  validates_length_of :last_name, :maximum => 20
  validate :work_phone_may_not_have_alphas, :home_phone_may_not_have_alphas, :fax_number_may_not_have_alphas, :primary_email_must_have_at_sign, :secondary_email_must_have_at_sign, :work_extension_may_not_have_alphas, :dues_paid_year_may_not_have_alphas
  validates :home_phone, :phone => true
  validates :work_phone, :phone => true
  scope :by_last_name, (lambda do |last_name| { :conditions => ['last_name LIKE ?', "%#{last_name}%"]} end)
  scope :members_only, where(:org_member => true)
  scope :board_only, where(:board_member => true)
  scope :emailers, where("email_1 <> ''")
  scope :sort_last_name, order(:last_name)
  scope :by_agency, (lambda do |agency| { :conditions => ['agency LIKE ?', "%#{agency}%"]} end)
  scope :by_first_name, (lambda do |first_name| { :conditions => ['first_name LIKE ?', "%#{first_name}%"]} end)
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
  def print_board_member
    board_member ? "Y" : "N"
  end
  def print_board_position
    board_position =~ /\w/ ? "#{board_position}" : "-"
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
  def print_work_extension
    work_extension =~ /\d/ ? "#{work_extension}" : "-"
  end
  def print_title_credential
    title_credential =~ /\w/ ? "#{title_credential}" : "-"
  end
  def print_title_credential_csv
    if title_credential =~ /\w/
      title_credential.gsub!(/,/, ';')
      "#{title_credential}"
    else
      "-"
    end
  end
  def print_county
    county =~ /\w/ ? "#{county}" : "-"
  end
  def print_org_member_type
    org_member_type =~ /\w/ ? "#{org_member_type}" : "-"
  end
  def print_dues_paid_year
    dues_paid_year =~ /\d/ ? "#{dues_paid_year}" : "-"
  end
  def print_practice_area
    if not practice_area_id.nil?
      return PracticeArea.find(practice_area_id).name
    else
      return "-"
    end
  end
  def print_secondary_practice_area
    if not secondary_practice_area_id.nil?
      return PracticeArea.find(secondary_practice_area_id).name
    else
      return "-"
    end
  end
  def print_endorsement_level
    if not endorsement_level_id.nil?
      return EndorsementLevel.find(endorsement_level_id).name
    else
      return "-"
    end
  end
  def work_phone_may_not_have_alphas
    if work_phone =~ /[a-zA-Z]/
      errors.add(:work_phone, "may not have letters")
    end
  end
  def work_extension_may_not_have_alphas
    errors.add(:work_extension, "may not have letters") if work_extension =~ /[a-zA-Z]/
  end
  def dues_paid_year_may_not_have_alphas
    errors.add(:dues_paid_year, "may not have letters") if dues_paid_year =~ /[a-zA-Z]/
  end
  def home_phone_may_not_have_alphas
    if home_phone =~ /[a-zA-Z]/
      errors.add(:home_phone, "may not have letters")
    end
  end
  def fax_number_may_not_have_alphas
    if fax_number =~ /[a-zA-Z]/
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
