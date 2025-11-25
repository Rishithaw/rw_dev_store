class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :base_price, presence: true, numericality: { greater_than: 0 }
end
