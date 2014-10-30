require 'rails_helper'

describe Property do
	it { should validate_presence_of :address }
	it { should validate_presence_of :price }
	it { should validate_presence_of :bedroom }
	it { should validate_presence_of :bathroom }

	it { should belong_to :user }

	it { should have_attached_file(:photo) }
end