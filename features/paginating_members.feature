Feature: Paginating members
  In order to ease the load on the server
  I want to paginate member results

  Background:
  Given there are the following users:
      | email    | password  | admin |
      | admin@njaimh.com  |  password | true |
  And I am signed in as them
  Given there are 20 members with practice area "Law" and secondary practice area "Psychiatric" and endorsement level "Mentor"

  Scenario:
    Given I am on the homepage
    And I follow "Contacts"
    And I should see 2 pages of pagination
