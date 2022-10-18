class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, confirmation: true, presence: true, uniqueness: true

  has_secure_password
end