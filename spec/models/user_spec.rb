require 'rails_helper'

describe User do
	it { should validate_presence_of :first_name }
end
