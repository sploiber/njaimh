Feature: Deleting members
In order to remove members
As a user
I want to press a button and make them go away

Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@njaimh.com  |  password | true |
  And I am signed in as them
  Given there is a member "Kyle Korver" with practice area "Public Health" and secondary practice area "Psychiatric" and an endorsement level "Applicant"
  And I am on the homepage
  And I follow "Contacts"
  When I follow "Kyle Korver"

  @members
Scenario: Deleting a member
  When I follow "Delete Contact"
  Then I should see "Contact has been deleted."
  Then I should not see "Kyle Korver"
