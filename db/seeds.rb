# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Companies
100.times do
  Company.create!(
    name: Faker::Company.name
    )
end
companies = Company.all

# Create Companies
20.times do
  Review.create!(
    email: "#{Faker::Internet.user_name}@#{companies.sample.name.delete(' ')}.com",
    title: Faker::Company.catch_phrase,
    body: Faker::Hacker.say_something_smart
    )
end