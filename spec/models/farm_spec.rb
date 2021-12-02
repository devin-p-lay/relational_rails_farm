require 'rails_helper'

describe Farm do
  describe 'relations' do
    it { should have_many :animals }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :acreage }
    it { should validate_presence_of :family_owned }
  end

  describe 'model methods' do
    before do
      @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
      @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
    end

    it 'can order by most recent creation' do
      expect(Farm.order_by_most_recently_created).to eq([@farm2, @farm1])
    end
  end
end