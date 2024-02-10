# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# seeds.rb

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do
  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
  veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
  commodo consequat."

3.times do |i|
  Post.create!(
    title: "Post #{i+1}",
    body: "#{lorem_ipsum}\n\n#{lorem_ipsum}\n\n#{lorem_ipsum}"
  )
end
