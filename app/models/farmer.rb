class Farmer < ApplicationRecord
  has_many :chores

  validates_presence_of :name
  validates_presence_of :age
end
