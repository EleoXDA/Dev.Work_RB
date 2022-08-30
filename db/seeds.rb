# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Booking.destroy_all
Challenge.destroy_all
Filter.destroy_all
User.destroy_all

puts "Generating seeds..."

lang = ['Java', 'Kotlin', 'Ruby', 'Javascript', 'Swift', 'Dart', 'CSS',
  'HTML', 'Bash', 'XML', 'C++', 'Rust', 'Pascal', 'Fortran', 'PHP',
  'Perl']
title = ['Help needed', 'Please FIX ASAP', 'DEV to the rescue', 'Stuck in loading',
"Doesn't Start up", 'Need a hand', 'Please please', 'Desperately in need',
'New workplace needs a Dev', 'Fix this join us']

filter_array = []
5.times do
  filter = Filter.new(name: lang.sample)
  filter.save!
  filter_array << filter
end

user_array = []
15.times do
  user = User.new(nickname: Faker::FunnyName.name,
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456")
  user.save!
  user_array << user
end

20.times do
  challenge = Challenge.new(title: title.sample,
                            content: Faker::Lorem.paragraphs(number: 2),
                            price_max: rand(100),
                            deadline: Faker::Date.between(from: '2022-09-10', to: '2022-12-31'),
                            filter: filter_array.sample,
                            user: user_array.sample)
  challenge.save!
end

puts "Seeds added..."
