class Order < ApplicationRecord

  validates :final_amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true, length: { maximum: 5 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }, length: { maximum: 2 }

  belongs_to :voucher
  belongs_to :product
  has_one :user, through: :vouchers
  has_one :brand, through: :products
end
