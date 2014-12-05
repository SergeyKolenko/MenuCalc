class Ingredient < ActiveRecord::Base
  belongs_to :dish
  belongs_to :food

  validates :dish, presence: true
  validates_associated :dish
  validates_associated :food

  validates :quantity, presence: true, numericality: {greater_then: 0}
end
