require 'rails_helper'

RSpec.describe Basic, type: :model do
	it "fail phone number - less number of digits" do
  		expect(build(:basic, phone: "123456789")).not_to be_valid
	end

	it "fail phone number - more number of digits" do
  		expect(build(:basic, phone: "12345678999")).not_to be_valid
	end

	it "fail full name nil" do
  		expect(build(:basic, full_name: nil)).not_to be_valid
	end	

	it "pass basic" do
	  	expect(build(:basic)).to be_valid
	end

end
