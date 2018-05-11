# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'


puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

######COCKTAIL
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_list = JSON.parse(open(url).read)["drinks"]

ingredient_list.each do |ingredient_hash|
  Ingredient.create!(
    name: ingredient_hash["strIngredient1"]
    )
end


10.times do |index|
  cocktail = Cocktail.create!(
    name: Faker::Pokemon.name + "#{index}"
    )
  5.times do
    dose = Dose.create!(
      description: "5cl",
      cocktail: cocktail,
      ingredient: Ingredient.all.sample
      )
  end
end

#INGREDIENT#########



puts 'database seeded. Well done Yann'
