FactoryGirl.define do
  factory :member do
    first_name 'Kyle'
    last_name 'Korver'
    address_1 '1715 Amwell Road'
    address_2 '#1'
    city 'Somerset'
    state 'NJ'
    zip '08873'
    home_phone '7322460009'
    work_phone '7322490110'
    email_1 'kyle@njaimh.org'
    email_2 'korver@njaimh.org'
    agency 'NJAIMH'
    fax_number '7322490111'
    board_member true
    org_member false
  end
end
