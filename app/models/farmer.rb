class Farmer < ApplicationRecord
  has_many :chores

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :full_time
end
