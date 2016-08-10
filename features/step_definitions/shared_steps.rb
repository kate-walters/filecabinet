Given(/^I have an existing user account$/) do
  User.create!(email: "user@example.com", name: "user", password: "password", admin: false)
end

Given(/^I have an existing admin account$/) do
  User.create!(email: "admin@example.com", name: "admin", password: "password", admin: true)
end

Given(/^I have an existing category$/) do
  Category.create!(name: "category-name")
end

Given(/^I have an existing photo$/) do
  Photo.create!(name: "photo", desc: "description", category: Category.first, user: User.first, upload: "http://imgs.xkcd.com/comics/tags.png")
end

Given(/^I have an existing note$/) do
  Note.create!(name: "note", body: "body", file_type: "txt", category: Category.first, user: User.first)
end

When(/^I visit "([^"]*)"$/) do |path|
  visit(path)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)

end

When(/^I find "([^"]*)"$/) do |id|
  # print page.html
  find_by_id(id)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^I debug$/) do
  puts page.html
  binding.pry
end

When(/^I upload the test photo$/) do
  attach_file("photo[upload]", Rails.root + "test/fixtures/test_photo.png")
end

Then(/^I should see "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^I should not see "([^"]*)"$/) do |content|
  refute page.has_content?(content)
end
