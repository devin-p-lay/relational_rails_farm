require 'rails_helper'

describe 'Chore Edit Page' do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 2, daily: true, farmer_id: @farmer1.id)
    visit "/chores/#{@chore1.id}/edit"
  end

  describe 'when i visit chore edit page' do
    it 'i fill out form and submit, i am taken to chore show where i see updated info' do
      fill_in "Title", with: "Milking Goats"
      fill_in "Duration", with: "5"
      fill_in "Daily", with: "yes"
      click_button "Submit Update"

      expect(current_path).to eq("/chores/#{@chore1.id}")
      expect(page).to have_content("Milking Goats")
    end
  end
end
