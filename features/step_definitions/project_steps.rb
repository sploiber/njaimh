Given /^there is a member called "([^\"]*)"$/ do |full|
  first_n, last_n  = full.split(" ")
  @member = FactoryGirl.create(:member, :last_name => last_n, :first_name => first_n)
end
Given /^there are (\d+) members$/ do |number|
  number.to_i.times do |i|
    test_name_f = "FirstName #{i}"
    test_name_l = "LastName #{i}"
    FactoryGirl.create(:member, :last_name => test_name_l, :first_name => test_name_f)
  end
end
