class Animal < ApplicationRecord
  belongs_to :farm

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :rescue
end
