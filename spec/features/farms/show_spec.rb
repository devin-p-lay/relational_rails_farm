require 'rails_helper'

describe 'Farm Show Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    visit "/farms/#{@farm1.id}"
  end

  describe 'when i visit a farm show page' do
    it 'i see the farm with their attributes' do
      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm1.acreage)
      expect(page).to have_content(@farm1.family_owned)
    end
  end
end