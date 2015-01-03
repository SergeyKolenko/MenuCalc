class Dish < ActiveRecord::Base
  belongs_to :dish_group
  has_many :ingredients, dependent: :destroy

  validates :dish_group, presence: true
  validates :price, numericality: {greater_then: 0}
  validates :total_weight, numericality: {greater_then: 0}

end
