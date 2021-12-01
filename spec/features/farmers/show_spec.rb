require 'rails_helper'

describe 'Farmer Show Page' do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    visit "/farmers/#{@farmer1.id}"
  end

  describe 'when I visit the Farmer show page' do
    it "I see the farmer with their attributes" do
      expect(page).to have_content(@farmer1.name)
      expect(page).to have_content(@farmer1.age)
      expect(page).to have_content(@farmer1.full_time)
    end
  end
end
