# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times { Post.create(title: Faker::Name.title, body: Faker::Company.bs) }

["Music", "Movies", "Foodie", "Vancouver", "Korea", "Canada", "Random", "Coding", "Science", "Codecore"].each do |cat|
  Category.create title: cat
end
