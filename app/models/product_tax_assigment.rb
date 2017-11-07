class ProductTaxAssigment < ApplicationRecord
  belongs_to :food
  belongs_to :tax
end
