Feature: Editing Endorsement Levels
  In order to update endorsement level information
  As a user
  I want to be able to do that through an interface

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
    Given there is an endorsement level called "Applicant"
    And I am on the homepage
    When I follow "Admin"
    When I follow "Endorsement Levels"
    When I follow "Applicant"
    And I follow "Edit Endorsement Level"

  @basic
  Scenario: Updating a endorsement level
    And I fill in "Name" with "6 beta"
    And I press "Finish"
    Then I should see "Endorsement Level has been updated."
    Then I should be on the endorsement level page for "6 beta"

  @basic
  Scenario: Updating a endorsement level with invalid attributes is bad
    And I fill in "Name" with ""
    And I press "Finish"
    Then I should see "Endorsement Level has not been updated."
