require 'rails_helper'

describe 'Farm Animals New Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    visit "/farms/#{@farm1.id}/animals/new"
  end

  describe 'when i visit a farm animals new page' do
    it 'i fill out the form, click submit, i am redirected index where i see new animal' do
      fill_in "Name", with: "Harriet the Horse"
      fill_in "Age", with: 7
      fill_in "Rescue", with: 'no'
      click_button "Create New Animal"

      expect(current_path).to eq("/farms/#{@farm1.id}/animals")
      expect(page).to have_content("Harriet the Horse")
    end
  end
end