Animal.destroy_all
Farm.destroy_all
Chore.destroy_all
Farmer.destroy_all

@farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
@farm2 = Farm.create!(name: "Lake Hill Farms", acreage: 150, family_owned: true)
@farm3 = Farm.create!(name: "Full Moon Farms", acreage: 200, family_owned: false)
@farm4 = Farm.create!(name: "Half Moon Farms", acreage: 250, family_owned: true)
@farm5 = Farm.create!(name: "Slow Bend Farms", acreage: 300, family_owned: true)

@farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
@farmer2 = Farmer.create!(name: "Farmer Devin", age: 35, full_time: true)
@farmer3 = Farmer.create!(name: "Ol MacDonald", age: 99, full_time: true)

@animal1  = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
@animal2  = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
@animal3  = @farm1.animals.create!(name: "David the Dog", age: 7, rescue: false)
@animal4  = @farm1.animals.create!(name: "Pontz the Pig", age: 6, rescue: true)
@animal5  = @farm1.animals.create!(name: "Caleb the Cow", age: 8, rescue: true)
@animal6  = @farm2.animals.create!(name: "Kevin the Cat", age: 9, rescue: true)
@animal7  = @farm2.animals.create!(name: "Peter the Pig", age: 6, rescue: true)
@animal8  = @farm2.animals.create!(name: "Cassy the Cow", age: 3, rescue: true)
@animal9  = @farm2.animals.create!(name: "Dorie the Dog", age: 2, rescue: true)
@animal10 = @farm3.animals.create!(name: "Perry the Pig", age: 6, rescue: true)
@animal11 = @farm3.animals.create!(name: "Caash the Cow", age: 3, rescue: true)
@animal12 = @farm3.animals.create!(name: "Derek the Dog", age: 2, rescue: true)
@animal13 = @farm4.animals.create!(name: "Potzy the Pig", age: 6, rescue: true)
@animal14 = @farm4.animals.create!(name: "Darty the Dog", age: 2, rescue: true)
@animal15 = @farm5.animals.create!(name: "Camie the Cow", age: 3, rescue: true)

@chore1  = @farmer1.chores.create!(title: "Feed Chickens", duration: 4, daily: true)
@chore2  = @farmer1.chores.create!(title: "Apple Picking", duration: 2, daily: true)
@chore3  = @farmer1.chores.create!(title: "Mowing Fields", duration: 6, daily: false)
@chore4  = @farmer1.chores.create!(title: "Milking Goats", duration: 3, daily: true)
@chore5  = @farmer1.chores.create!(title: "Herding Sheep", duration: 4, daily: true)
@chore6  = @farmer2.chores.create!(title: "Peach Picking", duration: 1, daily: true)
@chore7  = @farmer2.chores.create!(title: "Watering Land", duration: 2, daily: true)
@chore8  = @farmer2.chores.create!(title: "Herding Goats", duration: 3, daily: true)
@chore9  = @farmer2.chores.create!(title: "Milking Sheep", duration: 4, daily: true)
@chore10 = @farmer3.chores.create!(title: "Shearin Sheep", duration: 3, daily: true)
@chore11 = @farmer3.chores.create!(title: "Brushing Dogs", duration: 1, daily: true)
@chore12 = @farmer3.chores.create!(title: "Feed the Pigs", duration: 2, daily: true)
