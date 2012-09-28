Given /^there is a member called "([^\"]*)"$/ do |full|
  first_n, last_n  = full.split(" ")
  @member = FactoryGirl.create(:member, :last_name => last_n, :first_name => first_n)
end
Given /^there is a practice area called "([^\"]*)"$/ do |name|
  FactoryGirl.create(:practice_area, :name => name)
end
Given /^there are (\d+) members$/ do |number|
  number.to_i.times do |i|
    test_name_f = "FirstName #{i}"
    test_name_l = "LastName #{i}"
    FactoryGirl.create(:member, :last_name => test_name_l, :first_name => test_name_f)
  end
end
Given /^there are (\d+) practice areas$/ do |number|
  number.to_i.times do |i|
    FactoryGirl.create(:practice_area, :name => i.to_s)
  end
end
