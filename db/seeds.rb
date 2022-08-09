# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Page.create!(
  title: 'Home',
  body: '<p>This is your home page.</p>'
)
Page.create!(
  title: 'About',
  body: '<p>This is your about page.</p>'
)
