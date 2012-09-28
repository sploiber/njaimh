Feature: Editing members
  In order to edit a member
  As a user
  I want a form to edit them

  Background:
    Given there are the following users:
      | email    | password  | admin |
      | admin@njaimh.com  |  password | true |
    And I am signed in as them
    Given there is a member "Kyle Korver" with a practice area "Public Health"
    And I am on the homepage
    And I follow "Members"
    When I follow "Kyle Korver"
    And I follow "Edit Member"
  
  @members
  Scenario: Updating a member's first name
    When I fill in "First name" with "Bruce"
    And I press "Finish"
    Then I should see "Member has been updated."
    Then I should be on the member page for "Bruce Korver"
    And I should see "Bruce Korver"
    And I should not see "Kyle Korver"

  Scenario: Updating a member's last name
    When I fill in "Last name" with "Chan"
    And I press "Finish"
    Then I should see "Member has been updated."
    Then I should be on the member page for "Kyle Chan"
    And I should see "Kyle Chan"
    And I should not see "Kyle Korver"

  Scenario: Tweaking the org member field
    Then the radio button "member_org_member_true" should be checked
    And I choose "member_org_member_false"
    And I press "Finish"
    Then I should see "Member has been updated."
    Then I should see "Org Member?N"

  Scenario: Tweaking the board member field
    Then the radio button "member_board_member_false" should be checked
    And I choose "member_board_member_true"
    And I press "Finish"
    Then I should see "Member has been updated."
    Then I should see "Board Member?Y"
