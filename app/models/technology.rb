class Technology < ApplicationRecord
  has_many :product_technologies
  has_many :products, through: :product_technologies

  validates :name, presence: true, uniqueness: true
end
