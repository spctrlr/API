class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 0..20 }
  validates :email, confirmation: true, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, length: { in: 6..20 }
  validates :password_confirmation, confirmation: true, presence: true, length: { in: 6..20 }

  has_secure_password
  has_many :vouchers, dependent: :destroy
  validates_associated :vouchers
end
