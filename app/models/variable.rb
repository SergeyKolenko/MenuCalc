class Variable < ActiveRecord::Base

  validates :name, presence: true
  validates :value, numericality: {greater_then: 1.0}

  after_save :recalc

  private
  def recalc
      Dish.all.each do |dish|
        dish.price = dish.ingredients.joins(:food).sum('quantity * price') * Variable.find_by_name('price_factor').value
        dish.save
      end
  end
end
