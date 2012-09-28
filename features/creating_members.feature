Feature: Creating members
  In order to have members for NJAIMH
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email    | password  | admin |
      | admin@njaimh.com  |  password | true |
    And I am signed in as them
    Given I am on the homepage
    Given there is a practice area called "Public Health"
    Given there is an endorsement level called "Applicant"
    When I follow "Members"
    When I follow "New Member"

  @members
  Scenario: Creating a member
    And I select "Public Health" from "member[practice_area_id]"
    And I select "Applicant" from "member[endorsement_level_id]"
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has been created."
    And I should be on the member page for "Kyle Korver"
    And I should see "First Name Kyle"
    And I should see "Last Name Korver"

  @members
  Scenario: Creating a member without a first name
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "First name can't be blank"

  @members
  Scenario: Creating a member without a last name
    And I fill in "First name" with "Kyle"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Last name can't be blank"

  @members
  Scenario: Creating a member with a long first name
    And I fill in "First name" with "012345678901234567"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "First name is too long"

  @members
  Scenario: Creating a member with a long last name
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "0123456789012345678901"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Last name is too long"

  @members
  Scenario: Creating a member without an city
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "City can't be blank"

  @members
  Scenario: Creating a member with a short city
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "12"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "City is too short"

  @members
  Scenario: Creating a member with a long city
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "0123456789012345678901"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "City is too long"

  @members
  Scenario: Creating a member without a state
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "State can't be blank"

  @members
  Scenario: Creating a member with a short state
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "1"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "State is too short"

  @members
  Scenario: Creating a member with a long state
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "123"
    And I fill in "Zip" with "08873"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "State is too long"

  @members
  Scenario: Creating a member without a zip
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Zip can't be blank"

  Scenario: Creating a member with a short zip
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "1234"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Zip is too short"

  @members
  Scenario: Creating a member with a long zip
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Zip is too long"

  @members
  Scenario: Creating a member with a bad work phone
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Work phone" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Work phone may not have letters"

  @members
  Scenario: Creating a member with a bad home phone
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Home phone" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Home phone may not have letters"

  @members
  Scenario: Creating a member with a bad fax number
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Fax number" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Fax number may not have letters"

  @members
  Scenario: Creating a member with a bad work extension
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Work extension" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Work extension may not have letters"

  @members
  Scenario: Creating a member with a bad dues paid year
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Dues paid year" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Dues paid year may not have letters"

  @members
  Scenario: Creating a member with a bad primary email
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "member_email_1" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Primary email must have @ sign"

  @members
  Scenario: Creating a member with a bad secondary email
    And I fill in "First name" with "Kyle"
    And I fill in "Last name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "member_email_2" with "yes"
    And I press "Finish"
    Then I should see "Member has not been created."
    And I should see "Secondary email must have @ sign"
