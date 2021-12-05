class Farmer < ApplicationRecord
  has_many :chores, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :age

  def alphachore
    chores.order(:name)
  end
end
