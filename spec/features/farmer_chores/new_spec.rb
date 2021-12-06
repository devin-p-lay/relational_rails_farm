require 'rails_helper'

describe 'Farmer Chores New Page' do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    visit "/farmers/#{@farmer1.id}/chores/new"
  end

  describe 'form to create new farmer chore' do
    it "I fill out the form, click submit, i am redirected to index where I see the new chore" do
      fill_in "Title", with: "Friday Shed Cleanup"
      fill_in "Duration", with: "2"
      fill_in "Daily", with: 'no'
      click_button "Create New Chore"

      expect(current_path).to eq("/farmers/#{@farmer1.id}/chores")
      expect(page).to have_content("Friday Shed Cleanup")
    end
  end
end
