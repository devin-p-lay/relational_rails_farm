class Chore < ApplicationRecord
  belongs_to :farmer

  validates_presence_of :title
  validates_presence_of :duration

  def self.daily_filter
    where(daily: true)
  end
end
