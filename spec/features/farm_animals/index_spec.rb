require 'rails_helper'

describe "Farm Animals Index Page" do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    @animal2 = Animal.create!(name: "Carly Cow", age: 4, rescue: true, farm_id: @farm1.id)
    visit "farms/#{@farm1.id}/animals"
  end

  describe "When I visit the Farm's Animals Index page" do
    it "I see all of the animals from that farm and their attributes" do
      within "#animal-#{@animal1.id}" do
        expect(page).to have_content(@animal1.name)
        expect(page).to have_content(@animal1.age)
        expect(page).to have_content(@animal1.rescue)
      end

      within "#animal-#{@animal2.id}" do
        expect(page).to have_content(@animal2.name)
        expect(page).to have_content(@animal2.age)
        expect(page).to have_content(@animal2.rescue)
      end
    end
  end
end
