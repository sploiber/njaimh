Feature: Viewing members
In order to see all members available
As a user
I need there to be a member page

  @members
Scenario: Listing all members
  Given there is a member "Kyle Korver" with a practice area "Public Health"
  And I am on the homepage
  When I follow "Members"
  When I follow "Kyle Korver"
  Then I should be on the member page for "Kyle Korver"
