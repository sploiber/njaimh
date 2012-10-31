Feature: Editing members
  In order to edit a member
  As a user
  I want a form to edit them

  Background:
    Given there are the following users:
      | email    | password  | admin |
      | admin@njaimh.com  |  password | true |
    And I am signed in as them
    Given there is a member "Kyle Korver" with practice area "Public Health" and secondary practice area "Psychiatric" and an endorsement level "Applicant"
    And I am on the homepage
    And I follow "Contacts"
    When I follow "Kyle Korver"
    And I follow "Edit Contact"
  
  @members
  Scenario: Updating a member's first name
    When I fill in "First Name" with "Bruce"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Bruce Korver"
    And I should see "Bruce Korver"
    And I should not see "Kyle Korver"

  Scenario: Updating a member's last name
    When I fill in "Last Name" with "Chan"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Chan"
    And I should see "Kyle Chan"
    And I should not see "Kyle Korver"

  Scenario: Tweaking the org member field
    Then the radio button "member_org_member_true" should be checked
    And I choose "member_org_member_false"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should see "Org Member?N"

  Scenario: Tweaking the board member field
    Then the radio button "member_board_member_false" should be checked
    And I choose "member_board_member_true"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should see "Board Member?Y"

  Scenario: Updating a member's county
    When I fill in "County" with "Hunterdon"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "Hunterdon"

  Scenario: Updating a member's city
    When I fill in "City" with "Franklin"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "Franklin"

  Scenario: Updating a member's primary email
    When I fill in "member_email_1" with "rajabell@celtics.com"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "rajabell@celtics.com"
    And I should not see "kyle@njaimh.org"

  Scenario: Updating a member's work extension
    When I fill in "member_work_extension" with "132"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "132"
    And I should not see "115"

  Scenario: Updating a member's secondary email
    When I fill in "member_email_2" with "bigbaby@celtics.com"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "bigbaby@celtics.com"
    And I should not see "korver@njaimh.org"

  Scenario: Updating a member's agency
    When I fill in "Agency" with "Healthy Baby"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "Healthy Baby"
    And I should not see "NJAIMH"

  Scenario: Updating a member's fax number
    When I fill in "member_fax_number" with "7328282881"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "7328282881"
    And I should not see "7322490111"

  Scenario: Updating a member's dues paid year
    When I fill in "member_dues_paid_year" with "2014"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "2014"

  Scenario: Updating a member's title credential
    When I fill in "member_title_credential" with "Leader"
    And I press "Update"
    Then I should see "Contact has been updated."
    Then I should be on the member page for "Kyle Korver"
    And I should see "Leader"
    And I should not see "Emperor"
