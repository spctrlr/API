class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 1..20 }
end
