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