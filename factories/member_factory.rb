FactoryGirl.define do
  factory :member do
    first_name 'Kyle'
    last_name 'Korver'
    address_1 '1715 Amwell Road'
    address_2 '#1'
    city 'Somerset'
    county 'Somerset'
    state 'NJ'
    zip '08873'
    home_phone '7322460009'
    work_phone '7322490110'
    work_extension '115'
    email_1 'kyle@njaimh.org'
    email_2 'korver@njaimh.org'
    agency 'NJAIMH'
    fax_number '7322490111'
    board_member false
    org_member true
    dues_paid_year '2012'
    org_member_type 'Regular'
    title_credential 'Emperor'
    practice_area 'Public Health'
    endorsement_level 'Applicant'
  end
end
