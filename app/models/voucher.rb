class Voucher < ApplicationRecord
  validates :balance, :currency, :expires_on, presence: true
  validates :secret_code, presence: true, uniqueness: true

  belongs_to :user
end
