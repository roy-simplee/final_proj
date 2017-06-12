# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users
10.times do
  User.create!(
    email: Faker::Internet.email
    )
end

100.times do
  Company.create!(
    name: "#{Faker::Lorem.word}"
    )
end

5.times do
  Review.create!(
    )