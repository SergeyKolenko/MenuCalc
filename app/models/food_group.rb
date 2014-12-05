class FoodGroup < ActiveRecord::Base
  has_many :food

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
