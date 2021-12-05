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
      @farm1 = Farm.create!(name: "Blue Bell Farms", acreage: 100, family_owned: true)
      @farm2 = Farm.create!(name: "Lake Hill Farms", acreage: 150, family_owned: true)
      @animal1 = Animal.create!(name: "Peppa the Pig", age: 3, rescue: true, farm_id: @farm1.id)
      @animal2 = Animal.create!(name: "Carly the Cow", age: 5, rescue: true, farm_id: @farm1.id)
      @animal3 = Animal.create!(name: "David the Dog", age: 7, rescue: true, farm_id: @farm1.id)
    end

    describe 'AR method' do
      it '::order_by_most_recently_created' do
        expect(Farm.order_by_most_recently_created).to eq([@farm2, @farm1])
      end
    end

    describe 'model methods' do
      describe '::class_methods' do

        describe '::age_filter' do
          it 'can filter based on age' do
            expect(Farm.age_filter(5)).to eq([@animal3])
          end
        end
      end

      describe '#instance_methods' do

        describe '#animal_count' do
          it 'counts animals' do
            expect(@farm1.animal_count).to eq(3)
          end
        end

        describe '#animal_order' do
          it 'sorts alphabetically' do
            expect(@farm1.animal_order).to eq([@animal2, @animal3, @animal1])
          end
        end
      end
    end
  end
end
