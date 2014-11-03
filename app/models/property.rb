class Property < ActiveRecord::Base
	validates :address, presence: true
	validates :price, presence: true
	validates :bedroom, presence: true
	validates :bathroom, presence: true

	belongs_to :user

	has_attached_file :photo, styles: { medium: '300x300>' },
										url: "/assets/properties/:id/:style/:basename.:extension",
										path: ":rails_root/public/assets/properties/:id/:style/:basename.:extension"
										
	validates_attachment_content_type :photo, content_type: ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
end