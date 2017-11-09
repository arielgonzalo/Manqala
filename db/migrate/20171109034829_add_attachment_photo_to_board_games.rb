class AddAttachmentPhotoToBoardGames < ActiveRecord::Migration[5.1]
  def self.up
    change_table :board_games do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :board_games, :photo
  end
end
