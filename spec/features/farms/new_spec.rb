require 'rails_helper'

describe 'Farm New Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
    visit '/farms/new'
  end

  # describe 'when i visit a farm new page' do
  #   to 'i fill out form, click submit, i am taken back to the farm index' do
  #     fill_in 'Name', with: 'Pepperidge Farms'
  #     fill_in 'Acreage', with: '200'
  #     fill_in 'family_owned', with: 'false'
  #     click_button 'Submit'
  #
  #     expect(current_path).to eq('/farms')
  #     expect(Farm.count).to eq(3)
  #   end
  # end 
end
