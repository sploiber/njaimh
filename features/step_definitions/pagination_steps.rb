Then /^I should see (\d+) pages of pagination$/ do |number|
  pages = all(".pagination .page")
  pages.count.should eql(number.to_i)
end
