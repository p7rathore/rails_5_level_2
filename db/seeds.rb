# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create!([
	{
		name: "BugSmash",
		location: "Danver, CO",
		price: 0.00,
		description: "A fun evening of bug smashing",
		starts_at: 100.days.from_now
	},
	{
		name: "Hackathon",
		location: "Austin, TX",
		price: 15.00,
		description: "Hunker down at the Hackathon",
		starts_at: 15.days.from_now
	},
	{
		name: "kata Camp",
		location: "Dallas, TX",
		price: 75.00,
		description: "pratice your craft kata style",
		starts_at: 30.days.from_now
	}
])