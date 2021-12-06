require 'rails_helper'

describe 'Animal Index Page' do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @animal1 = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
    @animal2 = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
    @animal3 = @farm1.animals.create!(name: "David the Dog", age: 7, rescue: false)
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

    it "only rescue animals" do
      expect(page).to_not have_content(@animal3.name)
    end

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
          click_link "delete"
        end

        expect(current_path).to eq("/animals")
        expect(page).to_not have_content(@animal1.name)
      end
    end
  end
end
