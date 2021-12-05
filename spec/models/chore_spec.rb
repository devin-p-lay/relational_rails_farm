require 'rails_helper'

RSpec.describe Chore do
  describe 'relations' do
    it { should belong_to :farmer }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :duration }
  end

  describe 'model methods' do
    before do
      @farmer1 = Farmer.create!(name: "Paul Leonard", age: 28, full_time: true)
      @chore1  = Chore.create!(title: "Feed Chickens", duration: 4, daily: true, farmer_id: @farmer1.id)
      @chore2  = Chore.create!(title: "Apple Picking", duration: 2, daily: true, farmer_id: @farmer1.id)
      @chore3  = Chore.create!(title: "Mowing Fields", duration: 6, daily: false, farmer_id: @farmer1.id)
    end

    describe '::class_methods' do
      describe '::daily_filter' do
        it 'shows only daily chores' do
          expect(Chore.daily_filter).to eq([@chore1, @chore2])
        end
      end
    end
  end
end
