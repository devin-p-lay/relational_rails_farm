require 'rails_helper'

describe Farmer do
  describe 'relations' do
    it { should have_many :chores }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'model methods' do
    before do
      @farmer1 = Farmer.create!(name: "Randy Marsh", age: 45, full_time: true)
      @farmer2 = Farmer.create!(name: "Mr. Garrison", age: 50, full_time: true)
      @chore1  = Chore.create!(title: "Apple Picking", duration: 4, daily: true, farmer_id: @farmer1.id)
      @chore2  = Chore.create!(title: "Mowing", duration: 3, daily: false, farmer_id: @farmer1.id)
      @chore3  = Chore.create!(title: "Feeding Chickens", duration: 2, daily: true, farmer_id: @farmer1.id)
    end

    describe '::class_methods' do
      describe '::duration_filter' do
        it 'shows only chores above specified duration length' do
          expect(@farmer1.duration_filter(3)).to_not include(@chore3)
        end
      end
    end

    describe '#instance_methods' do
      describe '#chore_count' do
        it 'counts chores' do
          expect(@farmer1.chore_count).to eq(3)
        end
      end
      describe '#chore_order' do
        it 'sorts alphabetically' do
          expect(@farmer1.chore_order).to eq([@chore1, @chore3, @chore2])
        end
      end
    end
  end
end
