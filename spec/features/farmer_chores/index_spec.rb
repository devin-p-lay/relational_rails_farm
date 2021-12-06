require 'rails_helper'

describe "Farmer Chores Index Page " do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    @chore1  = @farmer1.chores.create!(title: "Feed Chickens", duration: 4, daily: true)
    @chore2  = @farmer1.chores.create!(title: "Apple Picking", duration: 2, daily: true)
    @chore3  = @farmer1.chores.create!(title: "Mowing Fields", duration: 6, daily: false)

    visit "/farmers/#{@farmer1.id}/chores"
  end

  describe "display" do
    it "each chore including their attributes" do
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
      it 'link to farmer chore new page' do
        click_link "Create New Chore"
        expect(current_path).to eq("/farmers/#{@farmer1.id}/chores/new")
      end
    end

    describe 'Sort Alphabetically' do
      it "link to sort chores in alphabetical order" do
        click_link "Sort Alphabetically"

        expect(current_path).to eq("/farmers/#{@farmer1.id}/chores/")
        expect(@chore2.title).to appear_before(@chore1.title)
        expect(@chore1.title).to appear_before(@chore3.title)
      end
    end

    describe 'display records over a given threshold' do
      it 'form allows me to input a number value' do
        fill_in :duration, with: '2'
        click_button 'Apply'

        expect(page).to have_content(@chore1.title)
        expect(page).to have_content(@chore3.title)
        expect(page).to_not have_content(@chore2.title)
      end
    end
  end
end
