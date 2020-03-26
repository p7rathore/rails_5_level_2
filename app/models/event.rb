class Event < ApplicationRecord
	validates :name, :location, :starts_at, presence: true 	

	validates :description, length: {minimum: 15}

	validates :price, numericality: {greater_than_or_equal_to: 0}

	validates :capacity, numericality: {only_integer: true, greater_than: 0}

	validates :image_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|png|jpg)\z/i, message: "must reference a GIF, JPG, or PNG image"	 
	} 

	has_many :registrations, dependent: :destroy 

	def free?
		price.blank? || price.zero? #we also write price == nil || price == 0
	end

	def self.upcoming
		# where("starts_at >= ?", 15.days.ago).order("starts_at")
		where("starts_at >= ?", Time.now).order("starts_at")
	end
end
