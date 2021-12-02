class Farm < ApplicationRecord
  has_many :animals

  validates_presence_of :name
  validates_presence_of :acreage
  validates_presence_of :family_owned

end
