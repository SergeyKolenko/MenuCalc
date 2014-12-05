class DishGroup < ActiveRecord::Base
  has_many :dish

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
