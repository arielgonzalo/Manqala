class TableGameTaxAssigment < ApplicationRecord
  belongs_to :table_game
  belongs_to :tax
end
