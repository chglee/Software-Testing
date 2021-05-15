Feature: Login page
  To test Login page of BSmart

  Scenario: Login in BSmartSchool with valid account and password
    Given I am on the BSmartSchool login page
    When enter Username/Email and Password for login
    Then Proceed to homepage
  Scenario: Login in BSmartSchool with invalid Username
    Given I am on the BSmartSchool login page again
    When enter valid Password but enter invalid Username
    Then Error message show