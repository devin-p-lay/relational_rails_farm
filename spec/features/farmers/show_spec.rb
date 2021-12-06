require 'rails_helper'

describe 'Farmer Show Page' do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    @chore1  = @farmer1.chores.create!(title: "Feed Chickens", duration: 4, daily: true)
    @chore2  = @farmer1.chores.create!(title: "Apple Picking", duration: 2, daily: true)
    visit "/farmers/#{@farmer1.id}"
  end

  describe 'display' do
    it "farmer with their attributes" do
      expect(page).to have_content(@farmer1.name)
      expect(page).to have_content(@farmer1.age)
      expect(page).to have_content(@farmer1.full_time)
    end

    it "farmers chore count" do
      expect(page).to have_content('Number of chores: 2')
    end

    it 'link to farmer chores index page' do
      click_link "#{@farmer1.name} Chores"
      expect(current_path).to eq("/farmers/#{@farmer1.id}/chores")
    end

    it 'link to update farmer' do
      click_link "Update #{@farmer1.name}"
      expect(current_path).to eq("/farmers/#{@farmer1.id}/edit")
    end

    it "link to delete farmer" do
      click_link "Delete #{@farmer1.name}"
      expect(current_path).to eq("/farmers")
      expect(page).to_not have_content(@farmer1.name)
    end
  end
end
