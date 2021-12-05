require 'rails_helper'

describe 'Farmer New Page' do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)
    visit '/farmers/new'
  end

  describe 'when I visit a farmer new page' do
    it "I fill out form, click sumbmit, i am taken back to farmer index and see new farm" do
      fill_in 'Name', with: 'Paul Leonard'
      fill_in 'Age', with: '28'
      fill_in 'Full Time', with: 'yes'
      click_button 'Submit'

      expect(current_path).to eq('/farmers')
      expect(Farmer.count).to eq 3
      expect(page).to have_content("Paul Leonard")
    end
  end
end
