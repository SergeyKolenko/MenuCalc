class Dish < ActiveRecord::Base
  belongs_to :dish_group
  has_many :ingredients, dependent: :destroy

  validates :dish_group, presence: true
  validates :price, numericality: {greater_then: 0}
  validates :total_weight, numericality: {greater_then: 0}

  # after_save :calc
  #
  # def calc
  #   unless ingredients.blank?
  #     total_weight = ingredients.sum :quantity
  #     price = ingredients.joins(:food).sum('quantity * price') * Variable.find_by_name('price_factor').value.to_f
  #     # self.save
  #   end
  # end

end
