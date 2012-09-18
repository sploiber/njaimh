Feature: Reporting members
  In order to help the NJ-AIMH count members
  I want to list all the members

  Background:
  Given there are the following users:
    | email    | password  | admin |
    | admin@ticketee.com  |  password | true |
  And I am signed in as them
    Given I am on the homepage
    Given there is a member called "Kyle Korver"
    Given I am on the homepage
    When I follow "Members"

  Scenario:
    And I follow "PrintExcelListing"
    And I choose "stuff_select_o_format_csv"
    And I press "Go!"
    Then I should see the table data:
       |Last Name|First Name|Address_1|Address_2|City|State|Zip|Work Phone Number|Home Phone|Primary Email Address|Secondary Email Address|Agency|
       |Korver|Kyle|1715 Amwell Road|#1|Somerset|NJ|08873|7322490110|7322460009|kyle@njaimh.org|korver@njaimh.org|NJAIMH|

  Scenario:
    And I follow "PrintExcelListing"
    And I choose "stuff_select_o_format_pdf"
    And I press "Go!"
    Then I should see the PDF table data:
       |Last Name|First Name|Address_1|Address_2|City|State|Zip|Work Phone Number|Home Phone|Primary Email Address|Secondary Email Address|Agency|
       |Korver|Kyle|1715 Amwell Road|#1|Somerset|NJ|08873|7322490110|7322460009|kyle@njaimh.org|korver@njaimh.org|NJAIMH|
