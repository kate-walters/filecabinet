Given(/^I have an existing dashboard environment/) do
  User.create!(email: "user@example.com", name: "user", password: "password")
  Category.create!(name: "category-name")
  Photo.create!(name: "photo", desc: "description", category: Category.first, user: User.first, upload: "http://imgs.xkcd.com/comics/tags.png")
  Note.create!(name: "note", body: "body", file_type: "txt", category: Category.first, user: User.first)
end
