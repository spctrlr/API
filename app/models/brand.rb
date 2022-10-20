class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
  validates :address, confirmation: true, presence: true, length: { in: 6..50 }
  validates :email, confirmation: true, presence: true, uniqueness: true

  has_many :products, dependent: :destroy
  
  # belongs_to :admin
end
