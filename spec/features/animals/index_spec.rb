require 'rails_helper'

describe 'Animal Index Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    @animal2 = Animal.create!(name: "Carly Cow", age: 5, rescue: true, farm_id: @farm1.id)
    # @animal3 = Animal.create!(name: "Harriet the Horse", age: 7, rescue: true, farm_id: @farm1.id)
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

    describe 'delete animal' do
      it 'link to delete each animal' do
        within "#animal-#{@animal1.id}" do
          click_link "Delete #{@animal1.name}"
        end

        expect(current_path).to eq("/animals")
        expect(page).to_not have_content(@animal1.name)
      end
    end 
  end
end
