class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :table_game
end
