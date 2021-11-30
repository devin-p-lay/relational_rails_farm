require 'rails_helper'

describe 'Farmer Index Page' do
  before do
    @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
    @farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)
    visit '/farmers'
  end

  describe 'when i visit Farmers index page' do
    it 'i see the name of each farmer in the system' do

      expect(page).to have_content(@farmer1.name)
      expect(page).to have_content(@farmer2.name)
    end
  end
end
