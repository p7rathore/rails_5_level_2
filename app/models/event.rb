class Event < ApplicationRecord
	validates :name, :location, :starts_at, presence: true 	

	validates :description, length: {minimum: 15}

	validates :price, numericality: {greater_than_or_equal_to: 0}

	validates :capacity, numericality: {only_integer: true, greater_than: 0}

	validates :image_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|png|jpg)\z/i, message: "must reference a GIF, JPG, or PNG image"	 
	} 

	has_many :registrations, dependent: :destroy 
	has_many :likes, dependent: :destroy
	has_many :likers, through: :likes, source: :user
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	scope :past, -> {where('starts_at < ?', Time.now).order(:starts_at)}# we slso write order("starts_at") in place of order(:starts_at) 
	scope :upcoming, -> {where("starts_at >= ?", Time.now).order(:starts_at)}# we slso write order("starts_at") in place of order(:starts_at) 
    scope :free, -> {upcoming.where(price: 0).order(:name)}# we slso write order("name") in place of order(:name) 
    # scope :recent, -> {past.limit(3)} #its's static scop without parametter
    scope :recent, ->(max=3){past.limit(max)} # its's static scop with parametter
    # scope :recent, ->(max){past.limit(max)}  #it's a dinamic scop 
	def free?
		price.blank? || price.zero? #we also write price == nil || price == 0
	end

	# def self.upcoming
	# 	# where("starts_at >= ?", 15.days.ago).order("starts_at")
	# 	where("starts_at >= ?", Time.now).order(:starts_at) # we also write like this where("starts_at >= ?",Time.now).order("starts_at")
	# end		

	def spots_left
		capacity - registrations.size
	end

	def sold_out?
		spots_left.zero?
	end


end
