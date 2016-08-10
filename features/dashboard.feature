Feature: As a User, I would like to be able to see notes and photos on the Dashboard.

Background: A User logs in
  Given I have an existing dashboard environment
    When I visit "/sign_in"
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    Then I should see "Welcome user!"

Scenario: User sees photos, notes, creates on dashboard
  And I should see "photo"
  And I should see "note"
  And I should see "Create a Photo"
