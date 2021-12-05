class Farm < ApplicationRecord
  has_many :animals, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :acreage

  def animal_count
    Animal.where(farm_id: self.id).count
  end

  def alphamal
    animals.order(:name)
  end

  def age_filter(age)
    animals.where("age > ?", age)
  end 
end
