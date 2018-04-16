# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all
Loan.destroy_all

10.times do
  User.create(name: Faker::FunnyName.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, avatar: Faker::Avatar.image)
end

# NOTE: replace name with title
25.times do
  Item.create(title: Faker::Book.title, picture: Faker::LoremPixel.image("50x60"), user_id: Faker::Number.between(1, 10), author: Faker::Book.author, genre: Faker::Book.genre, description: Faker::Lorem.paragraph)
end

20.times do
  Loan.create(item_id: Faker::Number.between(1, 25), borrower_id: Faker::Number.between(1, 10))
end
