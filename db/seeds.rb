# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Companies
20.times do
  Company.create!(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase
    )
end
companies = Company.all

# Create Reviews
review_scores = (0..5).to_a
100.times do
  c = companies.sample
  Review.create!(
    email: "#{Faker::Internet.user_name}@#{c.name.delete(' ')}.com",
    title: Faker::Company.catch_phrase,
    body: Faker::Hacker.say_something_smart,
    company: c,
    score: review_scores.sample
    )
end
reviews = Review.all

# Create review votes
vote_values = [-1, 1]
1000.times do
  r = reviews.sample
  ReviewVote.create!(
    review: r,
    vote: vote_values.sample
    )
end

# Create company votes
100.times do
  c = companies.sample
  CompanyVote.create!(
    company: c,
    vote: vote_values.sample
    )
end