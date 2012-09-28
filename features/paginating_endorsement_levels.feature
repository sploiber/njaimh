Feature: Paginating endorsement levels
  In order to ease the load on the server
  I want to paginate endorsement level results

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
  And there are 10 endorsement levels

  Scenario:
    Given I am on the homepage
    And I follow "Admin"
    And I follow "Endorsement Levels"
    And I should see 2 pages of pagination
