class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :company, presence: true
	validates :work_phone, presence: true
	validates :cell_phone, presence: true

	has_many :properties, dependent: :destroy

	has_secure_password
end