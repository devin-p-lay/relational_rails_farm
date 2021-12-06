require 'rails_helper'

describe 'Farmer New Page' do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    @farmer2 = Farmer.create!(name: "Farmer Devin", age: 35, full_time: true)
    visit '/farmers/new'
  end

  describe 'when I visit a farmer new page' do
    it "I fill out form, click sumbmit, i am taken back to farmer index and see new farm" do
      fill_in 'Name', with: 'Ol MacDonald'
      fill_in 'Age', with: 250
      fill_in :full_time, with: 'no'
      click_button 'Create Farmer'

      expect(current_path).to eq('/farmers')
      expect(Farmer.count).to eq 3
      expect(page).to have_content("Ol MacDonald")
    end
  end
end
