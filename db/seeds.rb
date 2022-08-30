# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

Booking.destroy_all
Challenge.destroy_all
Filter.destroy_all
User.destroy_all
user = User.new(nickname: "ben", name: "benjamin", email: 'ben@ben.com', password: "123456")
user.save!
filter = Filter.new(name: "Ruby")
challenge = Challenge.new(title: "New challenge", content: "Fancy new content!", price_max: 8, deadline: Date.today, user: user)
# challenge.user = user
challenge.filter = filter
challenge.save!

booking = Booking.new(review: "", price: 4, date: Date.today, user: user)
booking.challenge = challenge
booking.save!
