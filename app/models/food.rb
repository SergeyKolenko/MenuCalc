class Food < ActiveRecord::Base
  belongs_to :food_group
  has_many :ingredients, dependent: :destroy

  validates :food_group, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: {greater_then: 0}

  after_update :recalc_dish_price

  private
  def recalc_dish_price
    ingredients.each do |ingredient|
      ingredient.calc
    end
  end
end
