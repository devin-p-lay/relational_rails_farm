require 'rails_helper'

describe "Farm Animals Index Page" do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    @animal2 = Animal.create!(name: "Carly Cow", age: 5, rescue: true, farm_id: @farm1.id)
    @animal3 = Animal.create!(name: "Harriet the Horse", age: 7, rescue: true, farm_id: @farm1.id)
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

    describe 'create animal' do
      it 'when i click the link to create animal, i am taken to a farm animal new page' do
        click_link "Create New Animal"
        expect(current_path).to eq("/farms/#{@farm1.id}/animals/new")
      end
    end

    describe '::Alphabetical Sort' do
      it 'i see a link to sort children in alphabetical order' do
        click_link "Sort Alphabetically"
        expect(current_path).to eq("/farms/#{@farm1.id}/animals")
        expect(@animal2.name).to appear_before(@animal3.name)
        expect(@animal3.name).to appear_before(@animal1.name)
      end
    end

    describe 'Display records over a given threshold' do
      it 'i see a form that allows me to input a number value' do
        fill_in :age, with: '5'
        click_button 'Apply'

        expect(page).to have_content(@animal3.name)
        expect(page).to_not have_content(@animal1.name)
        expect(page).to_not have_content(@animal2.name)
      end
    end
  end
end
