require 'rails_helper'

describe "Farmer Chores Index Page " do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 4, daily: true, farmer_id: @farmer1.id)
    @chore2  = Chore.create!(title: "Mowing", duration: 3, daily: true, farmer_id: @farmer1.id)
    @chore3  = Chore.create!(title: "Feeding Chickens", duration: 2, daily: true, farmer_id: @farmer1.id)

    visit "/farmers/#{@farmer1.id}/chores"
  end

  describe "When I visit the Farmer Chores Index Page" do
    it "I see each chore for that Farmer including their attributes" do
      within "#chore-#{@chore1.id}" do
        expect(page).to have_content(@chore1.title)
        expect(page).to have_content(@chore1.duration)
        expect(page).to have_content(@chore1.daily)
      end

      within "#chore-#{@chore2.id}" do
        expect(page).to have_content(@chore2.title)
        expect(page).to have_content(@chore2.duration)
        expect(page).to have_content(@chore2.daily)
      end
    end

    describe 'create chore' do
      it 'when i click the link to create animal, i am taken to a farm animal new page' do
        click_link "Create New Chore"
        expect(current_path).to eq("/farmers/#{@farmer1.id}/chores/new")
      end
    end

    describe '::Alphabetical Sort' do
      it "i see a link to sort children in alphabetical order" do
        click_link "Sort Alphabetically"

        expect(current_path).to eq("/farmers/#{@farmer1.id}/chores/")
        expect(@chore3.title).to appear_before(@chore1.title)
        expect(@chore1.title).to appear_before(@chore2.title)
      end
    end

    describe 'Display records over a given threshold' do
      it 'i see a form that allows me to input a number value' do
        fill_in :duration, with: '2'
        click_button 'Apply'

        expect(page).to have_content(@chore1.title)
        expect(page).to have_content(@chore2.title)
        expect(page).to_not have_content(@chore3.title)
      end
    end
  end
end
