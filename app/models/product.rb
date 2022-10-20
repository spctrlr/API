class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :product_type, presence: true, length: { maximum: 20 } 

  # TESTING, should belong without option!
  belongs_to :brand, optional: true
  has_one :order
end
