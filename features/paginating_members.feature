Feature: Paginating members
  In order to ease the load on the server
  I want to paginate member results

  Background:
  Given there are 10 members

  Scenario:
    Given I am on the homepage
    And I follow "Members"
    And I should see 2 pages of pagination
