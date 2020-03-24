require "rails_helper"

describe "An event" do 
	it "is free if the price is $0" do
		event = Event.new(price: 0)

		expect(event.free?).to eq(true)
	end

	it "is not free if the price is non-$0" do 
		event = Event.new(price: 20.00)

		expect(event.free?).to eq(false)
	end

	it "is free it the price is blank" do 
		event = Event.new(price: nil)

		expect(event.free?).to eq(true)
	end
	
end
