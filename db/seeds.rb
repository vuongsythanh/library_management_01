30.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph
  Category.create! name: name, description: description
end

30.times do |n|
  name = Faker::Name.name
  address = Faker::Address.street_address
  phone = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.email
  description = Faker::Lorem.paragraph
  Publisher.create! name: name, address: address, phone: phone, email: email,
    description: description
end

30.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.paragraph
  Author.create! name: name, description: description
end

60.times do |n|
  title = Faker::Book.title
  description = Faker::Lorem.paragraph
  status = Faker::Boolean.boolean(0.2)
  image = Faker::Avatar.image
  category_id = Random.rand(1..30)
  author_id = Random.rand(1..30)
  publisher_id = Random.rand(1..30)
  Book.create! title: title, description: description, status: status, image: image,
    category_id: category_id, author_id: author_id, publisher_id: publisher_id
end
