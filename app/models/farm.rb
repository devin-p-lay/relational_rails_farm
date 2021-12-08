class Farm < ApplicationRecord
  has_many :animals, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :acreage

  def animal_count
    Animal.where(farm_id: self.id).count
  end

  def animal_order
    animals.order(:name)
  end

  def self.age_filter(age)
    Animal.where("age > ?", age)
  end

  def self.most_animals
    farm = Farm.all.sort do |farm|
      farm.animal_count
    end
    farm.reverse
  end

  def self.search_farm(search)
    where('name ILIKE ?', "%#{search}%")
  end
end