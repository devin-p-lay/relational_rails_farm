require 'rails_helper'

describe 'Animal Show Page'do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
    visit "/animals/#{@animal1.id}"
  end

  describe 'When I visit the animals show page' do
    it "I see that animal including their attributes" do
      expect(page).to have_content(@animal1.name)
      expect(page).to have_content(@animal1.age)
      expect(page).to have_content(@animal1.rescue)
    end

    describe 'i see a link to update that animal' do
      it 'when i click on that link, i am taken to animal update page' do
        click_link "Update Animal"
        expect(current_path).to eq("/animals/#{@animal1.id}/edit")
      end
    end
  end
end
