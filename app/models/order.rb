class Order < ApplicationRecord
  belongs_to :table
  has_one :product
  has_one :pass
end
