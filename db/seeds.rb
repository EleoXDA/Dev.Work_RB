# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# validates :title, :content, :price_max, :deadline, presence: true

# user = User.new(nickname: "Nriajaaoooo", name: "Nirajan", email: "stu1125615@as.com", password: "not my password")
# user.save!
# filter = Filter.new(name: "Java")
# challenge = Challenge.new(title: "center div", content: "Please center my div", price_max: 1000, deadline: Date.today, user:user)
# challenge.filter = filter
# challenge.save!


new_user = User.new(nickname: "Nriajaaoooo", name: "Weiss", email: "121@outlook.com", password: "not my password")
new_user.save!

filter = Filter.new(name: "Rails")
new_challenge = Challenge.new(title: "Fix my code!!", content: "Please fix my code", price_max: 10100, deadline: Date.today, user: new_user)
new_challenge.filter = filter
new_challenge.save!
