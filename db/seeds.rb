40.times do |n|
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
