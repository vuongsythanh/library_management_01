40.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph
  Category.create! name: name, description: description
end
