class InvoiceLine < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :pass
end
