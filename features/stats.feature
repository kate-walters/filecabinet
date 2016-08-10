Feature: As an Admin,
I want to see how many photos and notes a user has uploaded in the past week and all time,
So that I know who is active

Background: An Admin Logs In
  Given I have an existing admin account
  And another user account exists
  And there is an existing category
  And there is an existing note
  When I visit "/sign_in"
  And I fill in "Email" with "admin@example.com"
  And I fill in "Password" with "password"
  And I press "Submit"

Scenario: Admin sees user stats
  When I visit "/users"
  And I click "admin"
  Then I should see "has uploaded"
  And I should see "photos in the last week"
  And I should see "total photos"
