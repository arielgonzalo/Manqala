class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :table
  belongs_to :user
end
