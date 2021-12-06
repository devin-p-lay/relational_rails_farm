require 'rails_helper'

describe 'Animal Edit Page' do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @animal2 = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
    visit "/animals/#{@animal2.id}/edit"
  end

  describe 'when i visit animal edit page' do
    it 'i fill out form and submit, i am taken to animal show where i see updated info' do
      fill_in "Name", with: "Charles the Chicken"
      fill_in "Age", with: "4"
      fill_in "Rescue", with: "yes"
      click_button "Submit Update"

      expect(current_path).to eq("/animals/#{@animal2.id}")
      expect(page).to have_content("Charles the Chicken")
    end
  end
end