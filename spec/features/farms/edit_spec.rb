require 'rails_helper'

describe 'Farm Edit Page' do
  before do
    @farm2 = Farm.create!(name: "Lake Hill Farms", acreage: 150, family_owned: true)
    visit "/farms/#{@farm2.id}/edit"
  end

  describe 'when i visit a farm edit page' do
    it 'i fill out form, click submit and taken to farm show, where i see updated info' do
      fill_in "Name", with: "Ol' MacDonald's"
      fill_in "Acreage", with: "240"
      fill_in :family_owned, with: "yes"
      click_button "Update Farm"

      expect(current_path).to eq("/farms/#{@farm2.id}")
      expect(page).to have_content("Ol' MacDonald's")
    end
  end
end