require 'rails_helper'

describe 'Farm Show Page' do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @animal1 = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
    @animal2 = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
    visit "/farms/#{@farm1.id}"
  end

  describe 'display' do
    it 'farm with their attributes' do
      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm1.acreage)
      expect(page).to have_content(@farm1.family_owned)
    end


    it 'link that takes me tofarm animals index page' do
      click_link "#{@farm1.name} Animals"
      expect(current_path).to eq("/farms/#{@farm1.id}/animals")
    end

    it 'link to update farm' do
      click_link "Update #{@farm1.name}"
      expect(current_path).to eq("/farms/#{@farm1.id}/edit")
    end

    it 'link to delete farm' do
      click_link "Delete #{@farm1.name}"
      expect(current_path).to eq("/farms")
      expect(page).to_not have_content(@farm1.name)
    end
  end
end
