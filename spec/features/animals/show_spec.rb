require 'rails_helper'

describe 'Animal Show Page'do
  before do
    @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
    @animal1 = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
    visit "/animals/#{@animal1.id}"
  end

  describe 'display' do
    it "animal including their attributes" do
      expect(page).to have_content(@animal1.name)
      expect(page).to have_content(@animal1.age)
      expect(page).to have_content(@animal1.rescue)
    end

    describe 'update animal' do
      it 'has a link to update animal' do
        click_link "edit"
        expect(current_path).to eq("/animals/#{@animal1.id}/edit")
      end
    end

    describe 'destroy animal' do
      it 'has a link to delete animal' do
        click_link "delete"

        expect(current_path).to eq("/animals")
        expect(page).to_not have_content(@animal1.name)
      end
    end
  end
end
