40.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph
  Category.create! name: name, description: description
end

40.times do |n|
  title = Faker::Name.title
  description = Faker::Lorem.paragraph
  status = true
  category_id = 1 + (rand 40)
  Book.create! title: title, description: description, status: status, category_id: category_id
end
