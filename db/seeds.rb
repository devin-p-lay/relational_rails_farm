# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
@farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)

@farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
@farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)

@animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
@animal2 = Animal.create!(name: "Carly Cow", age: 4, rescue: true, farm_id: @farm1.id)