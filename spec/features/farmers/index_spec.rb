require 'rails_helper'

describe 'Farmer Index Page' do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    @farmer2 = Farmer.create!(name: "Farmer Devin", age: 35, full_time: true)
    @farmer3 = Farmer.create!(name: "Ol MacDonald", age: 99, full_time: true)
    @chore1  = @farmer1.chores.create!(title: "Feed Chickens", duration: 4, daily: true)
    @chore2  = @farmer1.chores.create!(title: "Apple Picking", duration: 2, daily: true)
    @chore3  = @farmer1.chores.create!(title: "Mowing Fields", duration: 6, daily: false)
    @chore4  = @farmer1.chores.create!(title: "Milking Goats", duration: 3, daily: true)
    @chore5  = @farmer1.chores.create!(title: "Herding Sheep", duration: 4, daily: true)
    @chore6  = @farmer2.chores.create!(title: "Peach Picking", duration: 1, daily: true)
    @chore7  = @farmer2.chores.create!(title: "Watering Land", duration: 2, daily: true)
    @chore8  = @farmer2.chores.create!(title: "Herding Goats", duration: 3, daily: true)
    @chore9  = @farmer2.chores.create!(title: "Milking Sheep", duration: 4, daily: true)
    @chore10 = @farmer3.chores.create!(title: "Shearin Sheep", duration: 3, daily: true)
    @chore11 = @farmer3.chores.create!(title: "Brushing Dogs", duration: 1, daily: true)
    @chore12 = @farmer3.chores.create!(title: "Feed the Pigs", duration: 2, daily: true)

    visit '/farmers'
  end

  describe 'display' do
    it 'name of each farmer' do
      expect(page).to have_content(@farmer1.name)
      expect(page).to have_content(@farmer2.name)
    end

    it "farmers ordered by most recently created first" do
      expect(@farmer2.name).to appear_before(@farmer1.name)
    end

    it "each farmer, I see when it was created" do
      within "#farmer-#{@farmer2.id}" do
        expect(page).to have_content(@farmer2.created_at)
      end
      within "#farmer-#{@farmer1.id}" do
        expect(page).to have_content(@farmer1.created_at)
      end
    end

    describe 'creating a new farmer' do
      it "a link takes me to a form to create a new farmer" do
        click_link "Create New Farmer"
        expect(current_path).to eq("/farmers/new")
      end
    end

    describe 'update farmer' do
      it "link to update next to each name" do
        within "#farmer-#{@farmer1.id}" do
          click_link "edit"
          expect(current_path).to eq("/farmers/#{@farmer1.id}/edit")
        end
      end
    end

    describe 'destroy farmer' do
      it "link to delete next to each name" do
        within "#farmer-#{@farmer1.id}" do
          click_link "delete"
        end

        expect(current_path).to eq("/farmers")
        expect(page).to_not have_content(@farmer1.name)
      end
    end

    describe 'farmer chore sort' do
      it "a link that sorts farmers by number of chores" do
        click_link "Sort by Chore Quantity"
        expect(@farmer1.name).to appear_before(@farmer2.name)
        expect(@farmer2.name).to appear_before(@farmer3.name)
      end
    end
  end
end
