class BoardGame < ApplicationRecord
  belongs_to :board_game_category
  has_attached_file :photo, content_type: { content_type: ["image/jpeg",    "image/gif", "image/jpg"] }
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
