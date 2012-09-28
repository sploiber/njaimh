Given /^there is a member "([^\"]*)" with a practice area "([^\"]*)"$/ do |full, prac_area|
  first_n, last_n  = full.split(" ")
  FactoryGirl.create(:practice_area, :name => prac_area) unless PracticeArea.find_by_name(prac_area) != nil
  @member = FactoryGirl.create(:member, :last_name => last_n, :first_name => first_n, :practice_area_id => PracticeArea.find_by_name(prac_area).id)
end
Given /^there is a practice area called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:practice_area, :name => name)
end
Given /^there are (\d+) members with practice area "([^\"]*)"$/ do |number, prac_area|
  FactoryGirl.create(:practice_area, :name => prac_area) unless PracticeArea.find_by_name(prac_area) != nil
  number.to_i.times do |i|
    test_name_f = "FirstName #{i}"
    test_name_l = "LastName #{i}"
    FactoryGirl.create(:member, :last_name => test_name_l, :first_name => test_name_f, :practice_area_id => PracticeArea.find_by_name(prac_area).id)
  end
end
Given /^there are (\d+) practice areas$/ do |number|
  number.to_i.times do |i|
    FactoryGirl.create(:practice_area, :name => i.to_s)
  end
end
