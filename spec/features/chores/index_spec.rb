require 'rails_helper'

describe "Chores Index Page" do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 4, daily: true, farmer_id: @farmer1.id)
    @chore2  = Chore.create!(title: "Mowing", duration: 3, daily: true, farmer_id: @farmer1.id)
    visit '/chores'
  end

  describe 'When I visit the Chore index page' do
    it "I see each chore including their attributes" do
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

    xit "I only see the daily chores" do
      expect(page).to_not have_content(@chore3.title)

      #i took out chore3 from before each
    end

    describe 'update chore' do
      it "link to update each chore" do
        within "#chore-#{@chore1.id}" do
          click_link "edit"
          expect(current_path).to eq("/chores/#{@chore1.id}/edit")
        end
      end
    end
  end
end
