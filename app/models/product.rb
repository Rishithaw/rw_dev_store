class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  has_and_belongs_to_many :technologies

  # Allow Ransack to search certain fields
  def self.ransackable_attributes(auth_object = nil)
    %w[name description base_price created_at updated_at category_id]
  end

  # Allow Ransack to search these associations
  def self.ransackable_associations(auth_object = nil)
    %w[category images_attachments images_blobs technologies]
  end
#   validates :name, presence: true, length: { minimum: 3 }
#   validates :description, presence: true, length: { minimum: 10 }
#   validates :base_price, presence: true, numericality: { greater_than: 0 }
end

