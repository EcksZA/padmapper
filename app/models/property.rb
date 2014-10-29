class Property < ActiveRecord::Base
	validates :address, presence: true
	
end