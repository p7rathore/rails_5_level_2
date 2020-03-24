class Event < ApplicationRecord
	def free?
		price.blank? || price.zero? #we also write price == nil || price == 0
	end
end
