require 'rails_helper'

describe 'Farm Index Page' do
  before do
    @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
    @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
    @farm3 = Farm.create!(name: "Blah blah farms", acreage: 150, family_owned: true)
    visit '/farms'
  end

  describe 'display' do
    it 'index farm' do

      expect(page).to have_content(@farm1.name)
      expect(page).to have_content(@farm2.name)
    end

    describe 'index sorted by most recently created' do
      it 'farms are ordered by most recently created first' do
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

    describe 'new farm' do
      it 'link takes me to a form to create new farm' do
        click_link "Create New Farm"
        expect(current_path).to eq("/farms/new")
      end
    end

    describe 'update farm' do
      it 'link to update next to each name' do
        within "#farm-#{@farm1.id}" do
          click_link "edit"
          expect(current_path).to eq("/farms/#{@farm1.id}/edit")
        end
      end
    end

    describe 'destroy farm' do
      it 'link to delete next to each name' do
        within "#farm-#{@farm3.id}" do
          click_link "Delete #{@farm3.name}"
        end

        expect(current_path).to eq("/farms")
        expect(page).to_not have_content(@farm3.name)
      end
    end
  end
end
