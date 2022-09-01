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
20.times do
  filter = Filter.new(name: lang.sample)
  filter.save!
  filter_array << filter
end

user_array = []
20.times do
  array = [
  "https://gravatar.com/avatar/38e6bc27f9d54cca67426924eb366a51?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/649d7427af905218ac3e3fc2c2e6c2d4?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/f00a238b97348910aeb3a18ac7920301?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/07b5a65d00de168c8d8e4e1f8044b129?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/01e150e9db07023122c524d0e58addea?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/70f155619cdd9f45ea23f3039940ef0d?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/e0399004b9c37b2c35525ad34c119620?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/dc0d182da3d2c3ee00549396b264e60b?s=200&d=robohash&r=x",
  "https://gravatar.com/avatar/18b00cafdca2767b9afb62b368110b7a?s=200&d=robohash&r=x"]
  user = User.new(nickname: Faker::FunnyName.name,
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456",
                  image_url: array.sample)
  user.save!
  user_array << user
end

50.times do
  addresses = [
    "Rue de Vermont, Geneva, Switzerland",
    "Grange Canal, Geneva, Switzerland",
    "University of Cambridge, Cambridge, United Kingdom",
    "University of Oxford, Oxford, United Kingdom",
    "Baneshwor, Kathmandu, Nepal"

  ]
  challenge = Challenge.new(title: title.sample,
                            content: Faker::Lorem.paragraphs(number: 2),
                            price_max: rand(100),
                            deadline: Faker::Date.between(from: '2022-09-10', to: '2022-12-31'),
                            filter: filter_array.sample,
                            user: user_array.sample,
                            location: addresses.sample
                          )
  challenge.save!
end

puts "Seeds added..."
