Feature: Log in and complete form

Scenario: Fill in the form and submit
Given I am logged in as a user
When fill in the form
And I submit the form
Then the form is accepted

Scenario: Fill in the form with no details and submit
Given I am logged in as a user
When I enter no details
And I submit the form
Then an error message is shown

Scenario: Fill in the form with invalid special characters
Given I am logged in as a user
When I enter invalid details
And I submit the form
Then an error message is shown

Scenario: Incorrect Password login
Given I visit the test site
And I login with an incorrect password
Then I receive a login error

Scenario: Login and log out
Given I am logged in as a user
When I click log out
Then I am taken to the log in page

Scenario: Fill in the form with no Interests and submit
Given I am logged in as a user
When fill in the form with no interests selected
And I submit the form
Then the form is accepted

Scenario: Fill in form, submit and go back to menu
Given I am logged in as a user
When fill in the form
And I submit the form
And the form is accepted
And I click back to menu
Then I return to the menu page