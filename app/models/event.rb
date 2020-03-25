class Event < ApplicationRecord
	def free?
		price.blank? || price.zero? #we also write price == nil || price == 0
	end

	def self.upcoming
		# where("starts_at >= ?", 15.days.ago).order("starts_at")
		where("starts_at >= ?", Time.now).order("starts_at")
	end
end
