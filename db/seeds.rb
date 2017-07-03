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

60.times do |n|
  publish_date = Faker::Date.between(2.days.ago, Date.today)
  number_page = Random.rand(1..10)
  limit_date = Random.rand(1..4)
  description = Faker::Lorem.paragraph
  book_id = Random.rand(1..60)
  AttachBook.create! publish_date: publish_date, number_page: number_page,
    limit_date: limit_date, description: description, book_id: book_id
end
