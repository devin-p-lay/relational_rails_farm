require 'rails_helper'

RSpec.describe Chore do
  describe 'relations' do
    it { should belong_to :farmer }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :daily }
  end
end
