class Property < ActiveRecord::Base
	validates :address, presence: true
	validates :price, presence: true
end