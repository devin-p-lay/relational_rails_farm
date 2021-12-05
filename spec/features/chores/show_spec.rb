require 'rails_helper'

describe "Chores Show Page" do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @chore1  = Chore.create!(title: "Milking Cows", duration: 2, daily: true, farmer_id: @farmer1.id)
    visit "/chores/#{@chore1.id}"
  end

  describe "When I visit the chores show page" do
    it "I see that chore including their attributes" do
      expect(page).to have_content(@chore1.title)
      expect(page).to have_content(@chore1.duration)
      expect(page).to have_content(@chore1.daily)
    end

    describe 'i see a link to update that chore' do
      it "when i click on that link, i am taken to a chore update page" do
        click_link "Update Chore"
        expect(current_path).to eq("/chores/#{@chore1.id}/edit")
      end
    end
  end
end
