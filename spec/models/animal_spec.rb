require 'rails_helper'

RSpec.describe Animal do
  describe 'relations' do
    it { should belong_to :farm }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :rescue }
  end
end