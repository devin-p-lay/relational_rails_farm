class Animal < ApplicationRecord
  belongs_to :farm

  validates_presence_of :name
  validates_presence_of :age
<<<<<<< HEAD
=======
  validates_presence_of :rescue

  def self.rescue_filter
    where(rescue: true)
  end 
>>>>>>> 8c9b90b2cd56112ae90956a8629bc16588e9ebf2
end
