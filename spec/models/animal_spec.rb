require 'rails_helper'

RSpec.describe Animal do
  describe 'relations' do
    it { should belong_to :farm }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'model methods' do
    before do
      @farm1 = Farm.create!(name: "Tegriddy Farms", acreage: 100, family_owned: true)
      @animal1 = Animal.create!(name: "Pepper Pig", age: 3, rescue: true, farm_id: @farm1.id)
      @animal2 = Animal.create!(name: "Carly Cow", age: 5, rescue: true, farm_id: @farm1.id)
      @animal3 = Animal.create!(name: "Harriet the Horse", age: 7, rescue: false, farm_id: @farm1.id)
    end

    describe '::class_methods' do
      describe '::rescue_filter' do
        it 'only shows rescue animals' do
          expect(Animal.rescue_filter).to eq([@animal1, @animal2])
        end
      end
    end
  end
end