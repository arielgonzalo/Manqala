class Order < ApplicationRecord
  belongs_to :table
  has_one :product
  has_one :pass
  validates :quantity, numericality: { greater_than: 0 }
end
