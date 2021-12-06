require 'rails_helper'

describe 'Farmer Index Page' do
  before do
    @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
    @farmer2 = Farmer.create!(name: "Farmer Devin", age: 35, full_time: true)
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
          click_link "Delete #{@farmer1.name}"
        end

        expect(current_path).to eq("/farmers")
        expect(page).to_not have_content(@farmer1.name)
      end
    end
  end
end
