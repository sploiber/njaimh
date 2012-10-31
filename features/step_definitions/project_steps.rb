Given /^there is a member "([^\"]*)" with practice area "([^\"]*)" and secondary practice area "([^\"]*)" and an endorsement level "([^\"]*)"$/ do |full, prac_area, secondary_practice_area, endor_level|
  first_n, last_n  = full.split(" ")
  FactoryGirl.create(:practice_area, :name => prac_area) unless PracticeArea.find_by_name(prac_area) != nil
  FactoryGirl.create(:practice_area, :name => secondary_practice_area) unless PracticeArea.find_by_name(secondary_practice_area) != nil
  FactoryGirl.create(:endorsement_level, :name => endor_level) unless EndorsementLevel.find_by_name(endor_level) != nil
  @member = FactoryGirl.create(:member, :last_name => last_n, :first_name => first_n, :practice_area_id => PracticeArea.find_by_name(prac_area).id, :secondary_practice_area_id => PracticeArea.find_by_name(secondary_practice_area).id, :endorsement_level_id => EndorsementLevel.find_by_name(endor_level).id)
end
Given /^there is a practice area called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:practice_area, :name => name)
end
Given /^there is an endorsement level called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:endorsement_level, :name => name)
end
Given /^there are (\d+) members with practice area "([^\"]*)" and secondary practice area "([^\"]*)" and endorsement level "([^\"]*)"$/ do |number, prac_area, secondary_practice_area, endor_level|
  FactoryGirl.create(:practice_area, :name => prac_area) unless PracticeArea.find_by_name(prac_area) != nil
  FactoryGirl.create(:practice_area, :name => secondary_practice_area) unless PracticeArea.find_by_name(secondary_practice_area) != nil
  FactoryGirl.create(:endorsement_level, :name => endor_level) unless EndorsementLevel.find_by_name(endor_level) != nil
  number.to_i.times do |i|
    test_name_f = "FirstName #{i}"
    test_name_l = "LastName #{i}"
    FactoryGirl.create(:member, :last_name => test_name_l, :first_name => test_name_f, :practice_area_id => PracticeArea.find_by_name(prac_area).id, :secondary_practice_area_id => PracticeArea.find_by_name(secondary_practice_area).id, :endorsement_level_id => EndorsementLevel.find_by_name(endor_level).id)
  end
end
Given /^there are (\d+) practice areas$/ do |number|
  number.to_i.times do |i|
    FactoryGirl.create(:practice_area, :name => i.to_s)
  end
end
Given /^there are (\d+) endorsement levels$/ do |number|
  number.to_i.times do |i|
    FactoryGirl.create(:endorsement_level, :name => i.to_s)
  end
end
