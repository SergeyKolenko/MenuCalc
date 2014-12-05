class Food < ActiveRecord::Base
  belongs_to :food_group
  has_many :ingredients

  validates :food_group, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: {greater_then: 0}

end
