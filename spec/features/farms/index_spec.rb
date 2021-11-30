require 'rails_helper'

describe 'Farm Index Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
    visit '/farms'
  end

  describe 'when i visit Farm index page' do
    it 'i see the name of each farm in the system' do

      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm2.name)
    end
  end
end
