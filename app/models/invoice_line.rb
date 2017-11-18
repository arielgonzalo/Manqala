class InvoiceLine < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :product, optional: true
  belongs_to :pass, optional: true
end
