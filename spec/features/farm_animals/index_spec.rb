require 'rails_helper'

describe "Farm Animals Index Page" do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @animal1 = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
    @animal2 = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
    @animal3 = @farm1.animals.create!(name: "David the Dog", age: 7, rescue: false)
    visit "farms/#{@farm1.id}/animals"
  end

  describe "display" do
    it "animals and their attributes" do
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
