require 'rails_helper'

describe 'Animal Index Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    @animal2 = Animal.create!(name: "Carly Cow", age: 4, rescue: true, farm_id: @farm1.id)
    # @animal3 = Animal.create!(name: "Sherry the Sheep", age: 2, rescue: false, farm_id: (@farm1.id))
    visit '/animals'
  end

  describe 'display' do
    it 'each animal including their attributes' do
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

    #test for only seeing the true boolean values dissapeard during git workflow 

    describe 'update animal' do
      it 'link to update each animal' do
        within "#animal-#{@animal1.id}" do
          click_link "edit"
          expect(current_path).to eq("/animals/#{@animal1.id}/edit")
        end
      end
    end
  end
end
