class AddAttachmentPhotoToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :properties, :photo
  end
end
