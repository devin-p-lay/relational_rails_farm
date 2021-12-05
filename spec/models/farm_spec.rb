require 'rails_helper'

describe Farm do
  describe 'relations' do
    it { should have_many :animals }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :acreage }
  end

  describe 'model methods' do
    before do
      @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
      @farm2 = Farm.create!(name: "J Mart Farms", acreage: 150, family_owned: true)
      @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
      @animal2 = Animal.create!(name: "Carly Cow", age: 4, rescue: true, farm_id: @farm1.id)
    end

    describe 'model methods' do
      describe '::class_methods' do
        it '::order_by_most_recently_created' do
          expect(Farm.order_by_most_recently_created).to eq([@farm2, @farm1])
        end
      end

      describe '#instance_methods' do
        it '#animal_count' do
          expect(@farm1.animal_count).to eq(2)
        end
      end
    end
  end
end
