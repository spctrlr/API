class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :product_type, presence: true, length: { maximum: 20 } 

  belongs_to :brand
end
