# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?


puts "Create ingredients"
uri = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
result = JSON.load(open(uri))
drinks = result["drinks"]

drinks.each do |d|
  i = Ingredient.create( name: d["strIngredient1"] )
  puts "create #{i.name}"
end

margarita = { name: "Margarita"}
martini = { name: "Dry Martini"}
manhattan = { name: "Manhattan" }

[margarita, martini, manhattan].each do |c|
  cocktail = Cocktail.create!(c)
  puts "created #{cocktail.name}"
end
