require 'rails_helper'

describe 'Farm Index Page' do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "Lake Hill Farms", acreage: 150, family_owned: true)
    @farm3 = Farm.create!(name: "Full Moon Farms", acreage: 200, family_owned: false)
    @farm4 = Farm.create!(name: "Half Moon Farms", acreage: 250, family_owned: false)
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

    visit '/farms'
  end

  describe 'display' do
    it 'index farm' do
      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm2.name)
    end

    describe 'index sorted by most recently created' do
      it 'farms are ordered by most recently created first' do
        expect(@farm2.name).to appear_before(@farm1.name)
      end

      it 'next to each farm, i see when it was created' do
        within "#farm-#{@farm2.id}" do
          expect(page).to have_content(@farm2.created_at)
        end
        within "#farm-#{@farm1.id}" do
          expect(page).to have_content(@farm1.created_at)
        end
      end
    end

    describe 'new farm' do
      it 'link takes me to a form to create new farm' do
        click_link "Create New Farm"
        expect(current_path).to eq("/farms/new")
      end
    end

    describe 'update farm' do
      it 'link to update next to each name' do
        within "#farm-#{@farm1.id}" do
          click_link "edit"
          expect(current_path).to eq("/farms/#{@farm1.id}/edit")
        end
      end
    end

    describe 'destroy farm' do
      it 'link to delete next to each name' do
        within "#farm-#{@farm3.id}" do
          click_link 'delete'
        end
        expect(current_path).to eq("/farms")
        expect(page).to_not have_content(@farm3.name)
      end
    end

    describe 'farm animal sort' do
      it 'a link that sorts farms by number of animals' do
        click_link "Sort by Animal Quantity"
        expect(@farm1.name).to appear_before(@farm2.name)
        expect(@farm2.name).to appear_before(@farm3.name)
      end
    end

    describe 'search by name, partial match' do
      it 'fill out form with case-insensitive partial match, click search, and return all records that are partial matched' do
        fill_in :search, with: "oOn"
        click_button 'search'
        expect(page).to have_content(@farm3.name)
        expect(page).to have_content(@farm4.name)
        expect(page).to_not have_content(@farm1.name)
        expect(page).to_not have_content(@farm2.name)
      end
    end
  end
end
