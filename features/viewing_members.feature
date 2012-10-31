Feature: Viewing members
In order to see all members available
As a user
I need there to be a member page

  @members
Scenario: Listing all members

  Given there are the following users:
    | email    | password  | admin |
    | admin@njaimh.com  |  password | true |
  And I am signed in as them
  Given there is a member "Kyle Korver" with practice area "Public Health" and secondary practice area "Psychiatric" and an endorsement level "Level 3"
  And I am on the homepage
  When I follow "Contacts"
  When I follow "Kyle Korver"
  Then I should be on the member page for "Kyle Korver"
