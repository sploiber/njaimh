Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the back-end

Background:
  Given there are the following users:
    |    email               | password  | admin |
    |   admin@njaimh.com   | password  | true  |
  And I am signed in as them
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Users"
  When I follow "New User"

Scenario: Creating a new user
  And I fill in "Email" with "newbie@njaimh.com"
  And I fill in "Password" with "password"
  And I press "Update User"
  Then I should see "User has been created."

Scenario: Creating a new user with bad data should fail
  And I fill in "Email" with ""
  And I fill in "Password" with "password"
  And I press "Update User"
  Then I should see "User has not been created."
  And I should see "Email can't be blank"

Scenario: Creating an admin user
  And I fill in "Email" with "newadmin@njaimh.com"
  And I fill in "Password" with "password"
  And I check "Is an admin?"
  And I press "Update User"
  Then I should see "User has been created."
  And I should see "newadmin@njaimh.com (Admin)"
