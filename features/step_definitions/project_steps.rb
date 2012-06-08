Given /^there is a member called "([^\"]*)"$/ do |full|
  first_n, last_n  = full.split(" ")
  @member = FactoryGirl.create(:member, :last_name => last_n, :first_name => first_n)
end
