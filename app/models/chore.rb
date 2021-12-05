class Chore < ApplicationRecord
  belongs_to :farmer

  validates_presence_of :title
  validates_presence_of :duration
end
