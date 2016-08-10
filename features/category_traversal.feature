Feature: As a User, In order to view the contents of a category, I would like to traverse to that category

Background: An Admin Logs In
  Given I have an existing test environment
    When I visit "/sign_in"
    And I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    Then I should see "Welcome admin!"

Scenario: Existing User Goes to Category Index
  And I visit "/categories"
  Then I should see "Parent Category1"
  And I should see "Parent Category2"
  And I should see "Parent Category3"

Scenario: Existing User Goes to Category show
  And I visit "/categories"
  And I click "Parent Category1"
  Then I should see "Current Path: Categories"
  And I should see "Parent Category1"
  And I should see "Child Category1"
  And I should see "Child Category2"
  And I should see "Note 1"
  And I should see "Note 2"
  And I should see "Photo 1"
  And I should see "Photo 2"

Scenario: Existing User Goes to Category show(2)
  And I visit "/categories"
  And I click "Parent Category2"
  Then I should see "Current Path: Categories"
  And I should see "Child Category3"

Scenario: Existing User goes to Category Show(3)
  And I visit "/categories"
  And I click "Parent Category3"
  Then I should see "Current Path: Categories"
  Then I should see "This folder is empty!"

Scenario: Existing User goes to Category Show(1.1)
  And I visit "/categories"
  And I click "Parent Category1"
  Then I should see "Current Path: Categories"
  And I click "Child Category1"
  Then I should see "Current Path: Categories"
  Then I should see "Photo 3"

Scenario: Existing User goes to Category Show(1.1) and back to Category Show (1)
  And I visit "/categories"
  And I click "Parent Category1"
  And I click "Child Category1"
  And I click "Parent Category1"
  Then I should see "Current Path: Categories"
  And I should see "Child Category1"
  And I should see "Child Category2"
  And I should see "Note 1"
  And I should see "Note 2"
  And I should see "Photo 1"
  And I should see "Photo 2"

Scenario: Existing User goes to Category Show(1.1) and back to Categories path
  And I visit "/categories"
  And I click "Parent Category1"
  And I click "Child Category1"
  And I find "in-page"
  And I click "in-page"
  Then I should see "Parent Category1"
  And I should see "Parent Category2"
  And I should see "Parent Category3"
