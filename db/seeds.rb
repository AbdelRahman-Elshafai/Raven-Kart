# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Seeding Roles table
Role.create([{ kind: 'admin' }, { kind: 'buyer' },{ kind: 'seller' }])


# Active admin default seed
User.create!(name: 'admin',email: 'admin@example.com', password: 'password',
             password_confirmation: 'password' ,address:'11-admin-admin' , role_id: 1)

# Seeding Statues table
Status.create([{ name: 'Pending' }, { name: 'Confirmed' }, { name: 'Delivered'}])

# Seeding Brands Table
10.times do
  Brand.create(name: Faker::TvShows::GameOfThrones.unique.house)
end

# Seeding Category Table
10.times do
  Category.create(name: Faker::TvShows::GameOfThrones.unique.city)
end

# Seeding Buyers
10.times do
  User.create!(name: Faker::Name.first_name, email: Faker::Internet.unique.email ,
               password: 'password',
               password_confirmation: 'password',
               address: '11-buyer-buyer',
               confirmed_at: Time.now,
               role_id: 2)
end

# Seeding Sellers
10.times do
  User.create!(name: Faker::Name.last_name, email: Faker::Internet.unique.email ,
               password: 'password',
               password_confirmation: 'password',
               address: '11-seller-seller',
               confirmed_at: Time.now,
               role_id: 3)
end

# Seeding Coupons
20.times do
  Coupon.create!(name: Faker::Commerce.unique.promotion_code,
                 expiration_date: Faker::Date.forward(10),
                 usage_limit: Faker::Number.between(1, 200),
                 deduction_type: %w[Percentage Amount].sample,
                 deduction_amount: Faker::Number.unique.between(10, 100))
end

# Seeding Store
10.times do
  Store.create!(name: Faker::TvShows::GameOfThrones.unique.dragon,
                summary: Faker::TvShows::GameOfThrones.unique.quote,
                user_id: Faker::Number.unique.within(12..21))
end

# Seeding Product
50.times do
  Product.create!(title: Faker::TvShows::GameOfThrones.unique.character,
                  description: Faker::TvShows::GameOfThrones.quote,
                  price: Faker::Number.between(100, 1000),
                  stock: Faker::Number.between(5, 20),
                  store_id: Faker::Number.between(1, 10),
                  brand_id: Faker::Number.between(1, 10),
                  category_id: Faker::Number.between(1, 10))
end


