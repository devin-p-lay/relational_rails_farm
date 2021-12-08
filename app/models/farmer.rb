class Farmer < ApplicationRecord
  has_many :chores, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :age

  def chore_count
    Chore.where(farmer_id: self.id).count
  end

  def chore_order
    chores.order(:title)
  end

  def duration_filter(duration)
    chores.where("duration > ?", duration)
  end

  def self.exact_search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
