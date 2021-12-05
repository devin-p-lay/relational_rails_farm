Animal.destroy_all
Farm.destroy_all
Chore.destroy_all
Farmer.destroy_all
@farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
@farm2 = Farm.create!(name: "Pepperidge Farms", acreage: 150, family_owned: true)
@farm3 = Farm.create!(name: "Ol' MacDonald Farms", acreage: 150, family_owned: true)

@farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
@farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)

@animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
@animal2 = Animal.create!(name: "Carly Cow", age: 5, rescue: true, farm_id: @farm1.id)
@animal3 = Animal.create!(name: "Harriet the Horse", age: 7, rescue: true, farm_id: @farm1.id)
@animal4 = Animal.create!(name: "Charles the Chicken", age: 6, rescue: true, farm_id: @farm1.id)
@animal5 = Animal.create!(name: "Daisy the Dog", age: 13, rescue: true, farm_id: @farm1.id)

@chore1  = Chore.create!(title: "Milking Cows", duration: 4, daily: true, farmer_id: @farmer1.id)
@chore2  = Chore.create!(title: "Mowing", duration: 3, daily: true, farmer_id: @farmer1.id)
@chore3  = Chore.create!(title: "Feeding Chickens", duration: 2, daily: true, farmer_id: @farmer1.id)
@chore4  = Chore.create!(title: "Brushing Horses", duration: 1, daily: true, farmer_id: @farmer1.id)
@chore5  = Chore.create!(title: "Herding Sheep", duration: 6, daily: true, farmer_id: @farmer1.id)
