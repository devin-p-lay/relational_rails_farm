require 'rails_helper'

describe Farmer do
  describe 'relations' do
    it { should have_many :chores }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :full_time }
  end
end
