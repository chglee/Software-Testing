Feature: BSmartSchool CRM management
  To add new opportunity and edit opportunity's details

  Scenario: Fill all information to create new opportunity
    Given I am on the CRM module and going to fill valid infor
    When Fill all information to create new opportunity
    Then I should see Passed message