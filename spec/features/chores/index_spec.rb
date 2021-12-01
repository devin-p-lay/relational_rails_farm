require 'rails_helper'

describe "Chores Index Page" do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 2, daily: true)
    @chore2  = Chore.create!(title: "Mowing", duration: 3, daily: true)
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
  end
end
