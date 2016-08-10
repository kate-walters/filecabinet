User.create!(name: "admin", email: "admin@example.com", password: "password", admin: true)
User.create!(name: "user", email: "user@example.com", password: "password", admin: false)

20.times do
  Tag.create(name: Faker::Commerce.color)
end


5.times do
  Category.create!(name: Faker::Company.buzzword)
  2.times do
    Category.create!(name: Faker::Company.buzzword, parent_category_id: rand(1..Category.count))
  end
end


NOTE_NAMES = ["Board_Meeting_2016-08-04", "Scrum_2016-08-04", "Sprint_Review_2016-08-04", "Employee_Evaluations_2016-08-04"]
NOTE_BODIES = ["We need to shut down the company - immediately", "Everyone is blocked by the pile-up of back-end stories", "nothing worked well - back to the drawing board for the next sprint", "Our employees suck - let's clean the house and start fresh"]
NOTE_TYPES = ["txt", "md"]

PHOTO_NAMES = ["White_Board_2016-08-04", "Meeting_Notes_2016-08-04", "Sprint_Review_Board_2016-08-04", "Scrum_Notes_2016-08-04"]
PHOTO_DESCS = ["White board photo from the meeting", "Photo-notes from the board meeting", "Photo of white board from sprint review", "Photo-notes from daily scrum"]

8.times do
  NOTE_NAMES.each_with_index do |name, i|
    Note.create!(name: name, body: NOTE_BODIES[i], file_type: NOTE_TYPES.sample, category_id: rand(1..Category.count), user_id: 1)
    Photo.create!(name: PHOTO_NAMES[i], desc: PHOTO_DESCS[i], category_id: rand(1..Category.count), user_id: 1, upload: "http://imgs.xkcd.com/comics/tags.png")
  end
end

2.times do
  NOTE_NAMES.each_with_index do |name, i|
    Note.create!(name: name, body: NOTE_BODIES[i], file_type: NOTE_TYPES.sample, category_id: rand(1..Category.count), user_id: 2)
    Photo.create!(name: PHOTO_NAMES[i], desc: PHOTO_DESCS[i], category_id: rand(1..Category.count), user_id: 2, upload: "http://imgs.xkcd.com/comics/tags.png")
  end
end
