require 'uri'
Given /^(?:|I) am on (.+)$/ do |page_name|
  visit path_to(page_name)
end
When /^(?:|I) press "([^"]*)"$/ do |button|
  click_button(button)
end
When /^(?:|I) follow "([^"]*)"$/ do |link|
  click_link(link)
end
When /^(?:|I) fill in "([^"]*)" with "([^"]*)"$/ do |field,value|
  fill_in(field, :with => value)
end
When /^(?:|I) check "([^"]*)"$/ do |field|
  check(field)
end
When /^(?:|I) select "([^"]*)" from "([^"]*)"$/ do |value,field|
  select(value, :from => field)
end
When /^(?:|I) choose "([^"]*)"$/ do |field|
  choose(field)
end
Then /^(?:|I) should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
Then /^(?:|I) should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
Then /^the radio button "([^"]*)" should be checked$/ do |label|
  field_checked = find_field(label)['checked']
  if field_checked.respond_to? :should
    field_checked.should be_true
  else
    assert field_checked
  end
end
Then /^(?:|I) should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
Then /^I should see the table data:$/ do |table|
  actual_table = CSV.parse(page.body.gsub(/<\/?[^>]*>/, "").gsub(/^$\n/, ""))
  table.diff!(actual_table)
end
Then /^I should see the PDF table data:$/ do |table|
  # Convert page source to PDF data, in a string
  z = page.source.force_encoding('UTF-8')
  str = ""
  # Generate a string. Note that the rows are not comma-separated
  PDF::Reader.open(StringIO.new(z)) do |q|
    q.pages.each do |q2|
      str << q2.text
    end
  end
  # Get the table data from the feature test, and convert it into a single
  # string
  table_data = ""
  data = table.raw
  data.each do |i|
    table_data << i.join("") << "\n"
  end
  # Get rid of ending CR
  table_data.chop!
  assert str.include?(table_data), "Data tables do not agree"
end
