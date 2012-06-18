Feature: Deleting Users
  In order to remove users
  As an admin
  I want to be able to click a button and get rid of them

Background:
  Given there are the following users:
    |    email               | password  | admin |
    |   admin@njaimh.com   | password  | true  |
  And I am signed in as them
  Given there are the following users:
    |    email               | password  |  admin |
    |   user@njaimh.com   | password  |   false  |
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Users"

Scenario: Delete a user
  And I follow "user@njaimh.com"
  When I follow "Delete User"
  Then I should see "User has been deleted."

Scenario: user cannot delete self
  And I follow "admin@njaimh.com"
  When I follow "Delete User"
  Then I should see "You cannot delete yourself!"
