require 'rails_helper'

describe 'Farm Show Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    @animal2 = Animal.create!(name: "Carly Cow", age: 4, rescue: true, farm_id: @farm1.id)
    visit "/farms/#{@farm1.id}"
  end

  describe 'when i visit a farm show page' do
    it 'i see the farm with their attributes' do
      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm1.acreage)
      expect(page).to have_content(@farm1.family_owned)
    end


    it 'i see a link that takes me to that farm animals index page' do
      click_link "#{@farm1.name} Animals"
      expect(current_path).to eq("/farms/#{@farm1.id}/animals")
    end

    it 'i see a link to update that farm' do
      click_link "Update #{@farm1.name}"
      expect(current_path).to eq("/farms/#{@farm1.id}/edit")
    end

    it 'i see a link to delete that farm' do
      click_link "Delete #{@farm1.name}"
      expect(current_path).to eq("/farms")
      expect(page).to_not have_content(@farm1.name)
    end 
  end
end
