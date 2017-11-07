class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :board_game
end
