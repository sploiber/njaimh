Feature: Editing Practice Areas
  In order to update practice area information
  As a user
  I want to be able to do that through an interface

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
    Given there is a practice area called "Public Health"
    And I am on the homepage
    When I follow "Admin"
    When I follow "Practice Areas"
    When I follow "Public Health"
    And I follow "Edit Practice Area"

  @basic
  Scenario: Updating a practice area
    And I fill in "Name" with "6 beta"
    And I press "Finish"
    Then I should see "Practice Area has been updated."
    Then I should be on the practice area page for "6 beta"

  @basic
  Scenario: Updating a practice area with invalid attributes is bad
    And I fill in "Name" with ""
    And I press "Finish"
    Then I should see "Practice Area has not been updated."
