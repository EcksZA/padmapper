require 'rails_helper'

describe Property do
	it { should validate_presence_of :address }
end