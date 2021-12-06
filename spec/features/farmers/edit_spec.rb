require 'rails_helper'

describe 'Farmer Edit Page' do
  before do
    @farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)
    visit "/farmers/#{@farmer2.id}/edit"
  end

  describe 'when I visit a farmers edit page' do
    it "i fill out form, click submit and taken to farmer show, where i see updated info" do
      fill_in "Name", with: "Mrs. Garrison"
      fill_in "Age", with: "50"
      fill_in :full_time, with: "yes"
      click_button "Update Farmer"

      expect(current_path).to eq("/farmers/#{@farmer2.id}")
      expect(page).to have_content("Mrs. Garrison")
    end
  end
end
