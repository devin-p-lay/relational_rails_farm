require 'rails_helper'

describe 'Farm Index Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
    visit '/farms'
  end

  describe 'when i visit Farm index page' do
    it 'i see the name of each farm in the system' do

      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm2.name)
    end
  end

  describe 'index sorted by most recently created' do
    it 'i see farms are ordered by most recently created first' do
      expect(@farm2.name).to appear_before(@farm1.name)
    end

    it 'next to each farm, i see when it was created' do
      within "#farm-#{@farm2.id}" do
        expect(page).to have_content(@farm2.created_at)
      end
      within "#farm-#{@farm1.id}" do
        expect(page).to have_content(@farm1.created_at)
      end
    end
  end

  describe 'creating a new farm' do
    it 'a link takes me to a form to create a new farm' do
      click_link "Create New Farm"
      expect(current_path).to eq("/farms/new")
    end
  end
end
