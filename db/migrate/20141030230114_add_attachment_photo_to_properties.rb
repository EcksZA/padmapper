class AddAttachmentPhotoToProperties < ActiveRecord::Migration
  def change
  	add_attachment :properties, :photo
  end
end
