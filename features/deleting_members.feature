Feature: Deleting members
In order to remove members
As a user
I want to press a button and make them go away

Background:
  Given there is a member called "Kyle Korver"
  And I am on the homepage
  And I follow "Members"
  When I follow "Kyle Korver"

  @members
Scenario: Deleting a member
  When I follow "Delete Member"
  Then I should see "Member has been deleted."
  Then I should not see "Kyle Korver"
