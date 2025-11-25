class Category < ApplicationRecord
  has_many :products

  # Allow Ransack to search certain fields
  def self.ransackable_attributes(auth_object = nil)
    %w[name description created_at updated_at]
  end

  # Allow Ransack to search associations
  def self.ransackable_associations(auth_object = nil)
    %w[products]
  end

  # validates :name, presence: true, uniqueness: true
end
