Feature: Creating endorsement levels

  Unit test suite for endorsement level. 
  The below actions will not be possible unless the user is an admin.

  In order to have endorsements to assign endorsement levels to
  As a user
  I want to create them easily

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
    Given I am on the homepage
    When I follow "Admin"
    When I follow "Endorsement Levels"
    When I follow "New Endorsement Level"

  @basic
  Scenario: Creating a endorsement level
    And I fill in "Name" with "Applicant"
    And I press "Finish"
    Then I should see "Endorsement Level has been created."
    And I should be on the endorsement level page for "Applicant"
    And I should see "Applicant"

  @basic
  Scenario: Creating a endorsement level a second time should fail
    And I fill in "Name" with "Applicant"
    And I press "Finish"
    Then I should see "Endorsement Level has been created."
    And I should be on the endorsement level page for "Applicant"
    And I follow "Return to All Endorsement Levels"
    And I follow "New Endorsement Level"
    And I fill in "Name" with "Applicant"
    And I press "Finish"
    And I should see "Endorsement Level has not been created."
    And I should see "Name has already been taken"

  @basic
  Scenario: Creating a endorsement level without a name should fail
    And I press "Finish"
    And I should see "Endorsement Level has not been created."
    And I should see "Name can't be blank"

  @basic
  Scenario: Creating a endorsement level with a long name should fail
    And I fill in "Name" with "123456789012345678901"
    And I press "Finish"
    And I should see "Endorsement Level has not been created."
    And I should see "Name is too long"
