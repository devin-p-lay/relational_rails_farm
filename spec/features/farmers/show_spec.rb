require 'rails_helper'

describe 'Farmer Show Page' do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 2, daily: true, farmer_id: @farmer1.id)
    @chore2  = Chore.create!(title: "Mowing", duration: 3, daily: true, farmer_id: @farmer1.id)
    visit "/farmers/#{@farmer1.id}"
  end

  describe 'when I visit the Farmer show page' do
    it "I see the farmer with their attributes" do
      expect(page).to have_content(@farmer1.name)
      expect(page).to have_content(@farmer1.age)
      expect(page).to have_content(@farmer1.full_time)
    end

    it "I see a count of the number of chores associated with this farmer" do
      expect(page).to have_content('Number of chores: 2')
    end

    it 'i see a link that takes me to that farmer chores index page' do
      click_link "#{@farmer1.name} Chores"
      expect(current_path).to eq("/farmers/#{@farmer1.id}/chores")
    end

    it 'i see a link to update that farmer' do
      click_link "Update #{@farmer1.name}"
      expect(current_path).to eq("/farmers/#{@farmer1.id}/edit")
    end
  end
end
