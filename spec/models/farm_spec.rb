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
      @farm3 = Farm.create!(name: "Full Moon Farms", acreage: 200, family_owned: false)
      @farm4 = Farm.create!(name: "Half Moon Farms", acreage: 250, family_owned: true)
      @animal1 = @farm1.animals.create!(name: "Peppa the Pig", age: 3, rescue: true)
      @animal2 = @farm1.animals.create!(name: "Carly the Cow", age: 5, rescue: true)
      @animal3 = @farm1.animals.create!(name: "David the Dog", age: 7, rescue: false)
      @animal4 = @farm2.animals.create!(name: "Pontz the Pig", age: 6, rescue: true)
      @animal5 = @farm2.animals.create!(name: "Caleb the Cow", age: 8, rescue: true)
      @animal6 = @farm4.animals.create!(name: "Kevin the Cat", age: 9, rescue: true)
    end

    describe 'AR method' do
      it '::order_by_most_recently_created' do
        expect(Farm.order_by_most_recently_created.to_a).to eq([@farm4, @farm3, @farm2, @farm1])
      end
    end

    describe 'model methods' do
      describe '::class_methods' do

        describe '::age_filter' do
          it 'can filter based on age' do
            expect(Farm.age_filter(6)).to eq([@animal3, @animal5, @animal6])
          end
        end

        describe '::most_animals' do
          it 'can sort farms by most animals' do
            expect(Farm.most_animals).to eq([@farm1, @farm2, @farm4, @farm3])
          end
        end

        describe '::search_farm' do
          it 'returns all records with a partial, case-insensitive match' do
            expect(Farm.search_farm("oOn")).to eq([@farm3, @farm4])
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
