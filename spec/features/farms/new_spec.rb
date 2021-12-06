require 'rails_helper'

describe 'Farm New Page' do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "Lake Hill Farms", acreage: 150, family_owned: true)
    visit '/farms/new'
  end

  describe 'when i visit a farm new page' do
    it 'i fill out form, click submit, i am taken back to the farm index where i see new farm' do
      fill_in 'Name', with: 'Pepperidge Farms'
      fill_in 'Acreage', with: '200'
      fill_in 'family_owned', with: 'true'
      click_button 'Submit'

      expect(current_path).to eq('/farms')
      expect(Farm.count).to eq(3)
      expect(page).to have_content("Pepperidge Farms")
    end
  end
end
