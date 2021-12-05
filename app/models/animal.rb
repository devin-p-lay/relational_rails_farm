class Animal < ApplicationRecord
  belongs_to :farm

  validates_presence_of :name
  validates_presence_of :age

  def self.rescue_filter
    where(rescue: true)
  end
end
