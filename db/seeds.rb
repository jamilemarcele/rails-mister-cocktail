# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'httparty'

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Starting seed 🌱'

# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# json = open(url).read
# objs = JSON.parse(json)
# objs["drinks"].each do |obj|
#   Ingredient.create(name: obj["strIngredient1"])
# end

# Here I'm getting all cocktails to be able to get the cocktail id

response = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail')
cocktails = response.parsed_response['drinks']

# Iterating through the 'drinks' array and access the cocktail using the ID
cocktails[0..100].each do |c|
  c_id = c['idDrink']
  cocktail_response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{c_id}")
  cocktail_by_id = cocktail_response.parsed_response['drinks'][0]

  name = cocktail_by_id['strDrink']

  photo = URI.open(c['strDrinkThumb'])
  cocktail = Cocktail.create!(name: name)
  cocktail.photo.attach(io: photo, filename: "#{name}.jpeg", content_type: 'image/jpeg')

  (1..15).each do |i|
    ingredient = cocktail_by_id["strIngredient#{i}"]

    next unless ingredient && ingredient != ''

    cocktail_ingredient = if !Ingredient.find_by name: ingredient
                            Ingredient.create!(name: ingredient)
                          else
                            Ingredient.find_by name: ingredient
                          end

    description = cocktail_by_id["strMeasure#{i}"] || '.'

    Dose.create!(
      description: description,
      cocktail: cocktail,
      ingredient: cocktail_ingredient
    )
  end
end

puts 'Finished seeding file 😀'
