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
    Given there is a practice area called "Psychiatric"
    Given there is an endorsement level called "Applicant"
    When I follow "Contacts"
    When I follow "New Contact"

  @members
  Scenario: Creating a member
    And I select "Public Health" from "member[practice_area_id]"
    And I select "Psychiatric" from "member[secondary_practice_area_id]"
    And I select "Applicant" from "member[endorsement_level_id]"
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I fill in "Home/Cell Phone" with "(732)420-2322"
    And I fill in "Work Phone" with "(732)420-3412"
    And I press "Create"
    Then I should see "Contact has been created."
    And I should be on the member page for "Kyle Korver"
    And I should see "First Name Kyle"
    And I should see "Last Name Korver"

  @members
  Scenario: Creating a member without a first name
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "First name can't be blank"

  @members
  Scenario: Creating a member without a last name
    And I fill in "First Name" with "Kyle"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Last name can't be blank"

  @members
  Scenario: Creating a member with a long first name
    And I fill in "First Name" with "012345678901234567"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "First name is too long"

  @members
  Scenario: Creating a member with a long last name
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "0123456789012345678901"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "08873"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Last name is too long"

  @members
  Scenario: Creating a member with a bad work phone
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Work Phone" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Work phone may not have letters"

  @members
  Scenario: Creating a member with a bad home phone
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Home/Cell Phone" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Home phone may not have letters"

  @members
  Scenario: Creating a member with a bad fax number
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Fax Number" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Fax number may not have letters"

  @members
  Scenario: Creating a member with a bad work extension
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Work Extension" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Work extension may not have letters"

  @members
  Scenario: Creating a member with a bad dues paid year
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "Dues Paid Year" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Dues paid year may not have letters"

  @members
  Scenario: Creating a member with a bad primary email
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "member_email_1" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Primary email must have @ sign"

  @members
  Scenario: Creating a member with a bad secondary email
    And I fill in "First Name" with "Kyle"
    And I fill in "Last Name" with "Korver"
    And I fill in "Address" with "1715 Amwell Road"
    And I fill in "City" with "Somerset"
    And I fill in "State" with "NJ"
    And I fill in "Zip" with "012345678901"
    And I fill in "member_email_2" with "yes"
    And I press "Create"
    Then I should see "Contact has not been created."
    And I should see "Secondary email must have @ sign"
