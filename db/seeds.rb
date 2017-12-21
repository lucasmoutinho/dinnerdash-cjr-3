# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Meal.delete_all
MealCategory.delete_all

MealCategory.create!(name:"Massas")
MealCategory.create!(name:"Entradas")
MealCategory.create!(name:"Carnes")
MealCategory.create!(name:"Outros")

Meal.create!(title:"Macarrão ao Molho de Cebola", description: "Especialidade da casa", price:"29,99",
             meal_category_id: MealCategory.find_by(name: 'Massas'))
Meal.create!(title:"Panqueca de Carne do Chef", description: "Tradição de Família", price:"14,99",
             meal_category_id: MealCategory.find_by(name: 'Massas'))
Meal.create!(title:"Salada de Folhas Tropicais", description: "Daqui da região mesmo", price:"16,99",
             meal_category_id: MealCategory.find_by(name: 'Entradas'))
Meal.create!(title:"Anéis de Cebola Frita com Queijo", description: "Porção individual", price:"9,99",
             meal_category_id: MealCategory.find_by(name: 'Carnes'))
Meal.create!(title:"Cordeiro", description: "Porção para dois", price:"49,99",
             meal_category_id: MealCategory.find_by(name: 'Vegetariano'))
Meal.create!(title:"Porco", description: "Porção para dois", price:"35,99",
             meal_category_id: MealCategory.find_by(name: 'Carnes'))
