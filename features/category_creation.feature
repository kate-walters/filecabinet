Feature: As an Admin, I would like to be able to create Categories in my location of choice

Background: An Admin Logs In and Goes to Category Index
  Given I have an existing test environment
    When I visit "/sign_in"
    And I fill in "Email" with "admin@example.com"
    And I fill in "Password" with "password"
    And I press "Submit"
    Then I should see "Welcome admin!"
    And I visit "/categories"

Scenario: Existing Admin Sees Category Creation Page
  And I click "Create Category"
  Then I should see "New Category"
  And I should see "Name"

Scenario: Existing Admin Creates Category
  And I click "Create Category"
  And I fill in "Name" with "Butts"
  And I press "Create Category"
  Then I should see "Categories"
  And I should see "This folder is empty!"

Scenario: Existing Admin Creates Sub-Category
  And I click "Parent Category1"
  And I click "Create Category"
  And I fill in "Name" with "Butts"
  And I press "Create Category"
  Then I should see "Categories"
  And I should see "Parent Category1"

Scenario: Existing Admin Creates Sub-Sub-Category
  And I click "Parent Category1"
  And I click "Child Category1"
  And I click "Create Category"
  And I fill in "Name" with "Butts"
  And I press "Create Category"
  Then I should see "Categories"
  And I should see "Parent Category1"
  And I should see "Child Category1"

Scenario: Existing Admin Creates Sub-Sub-Category And Navigates back to Index and back to Sub-Sub Category
  And I click "Parent Category1"
  And I click "Child Category1"
  And I click "Create Category"
  And I fill in "Name" with "Butts"
  And I press "Create Category"
  Then I should see "Categories"
  And I should see "Parent Category1"
  And I should see "Child Category1"
  And I find "in-page"
  And I click "in-page"
  And I click "Parent Category1"
  And I click "Child Category1"
  And I click "Butts"
  Then I should see "Categories"
  And I should see "Parent Category1"
  And I should see "Child Category1"
