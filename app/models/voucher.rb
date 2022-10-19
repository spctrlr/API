class Voucher < ApplicationRecord
  validates :balance, presence: true
  validates :currency, presence: true, length: { maximum: 5 }
  validates :secret_code, presence: true, uniqueness: true

  # TESTING, should belong without option!
  belongs_to :user, optional: true
end
