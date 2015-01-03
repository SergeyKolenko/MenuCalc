class Ingredient < ActiveRecord::Base
  belongs_to :dish
  belongs_to :food

  validates :dish, presence: true
  validates_associated :dish
  validates_associated :food

  validates :quantity, presence: true, numericality: {greater_then: 0}

  after_save :calc
  after_destroy :calc


  def calc
    unless dish.ingredients.blank?
      dish.total_weight = dish.ingredients.sum :quantity
      dish.price = dish.ingredients.joins(:food).sum('quantity * price') * Variable.find_by_name('price_factor').value
    else
      dish.total_weight = 0
      dish.price = 0
    end

    dish.save

  end

end
