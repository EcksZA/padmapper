class Property < ActiveRecord::Base
	validates :address, presence: true
	validates :price, presence: true
	validates :bedroom, presence: true
	validates :bathroom, presence: true

	belongs_to :user, dependent: :destroy
end