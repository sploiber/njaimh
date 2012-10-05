Feature: Creating practice areas

  Unit test suite for practice area. 
  The below actions will not be possible unless the user is an admin.

  In order to have practices to assign practice areas to
  As a user
  I want to create them easily

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
    Given I am on the homepage
    When I follow "Admin"
    When I follow "Practice Areas"
    When I follow "New Practice Area"

  @basic
  Scenario: Creating a practice area
    And I fill in "Name" with "Early Childhood"
    And I press "Create"
    Then I should see "Practice Area has been created."
    And I should be on the practice area page for "Early Childhood"
    And I should see "Early Childhood"

  @basic
  Scenario: Creating a practice area a second time should fail
    And I fill in "Name" with "Early Childhood"
    And I press "Create"
    Then I should see "Practice Area has been created."
    And I should be on the practice area page for "Early Childhood"
    And I follow "Return to All Practice Areas"
    And I follow "New Practice Area"
    And I fill in "Name" with "Early Childhood"
    And I press "Create"
    And I should see "Practice Area has not been created."
    And I should see "Name has already been taken"

  @basic
  Scenario: Creating a practice area without a name should fail
    And I press "Create"
    And I should see "Practice Area has not been created."
    And I should see "Name can't be blank"

  @basic
  Scenario: Creating a practice area with a long name should fail
    And I fill in "Name" with "123456789012345678901"
    And I press "Create"
    And I should see "Practice Area has not been created."
    And I should see "Name is too long"
