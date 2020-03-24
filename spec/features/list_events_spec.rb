require "rails_helper"

describe "Viewing the list of events" do 
	it "shows the event" do 
		# visit "http://example.com/events"
		visit events_url #we also write evets_path
		expect(page).to have_text("3 Events")
		expect(page).to have_text("Event 1")
		expect(page).to have_text("Event 2")
		expect(page).to have_text("Event 3")
	end	
end