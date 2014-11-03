require 'rails_helper'

describe User do
	it { should validate_presence_of :first_name }
	it { should validate_presence_of :last_name }
	it { should validate_presence_of :company }
	it { should validate_presence_of :work_phone }
	it { should validate_presence_of :cell_phone }

	it { should have_many(:properties).dependent(:destroy) }

	it { should have_secure_password }

	it { should validate_presence_of :email }
	it { should validate_uniqueness_of :email }
end
