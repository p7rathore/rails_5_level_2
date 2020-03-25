class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	
	def show
		@event  = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end


	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to @event #we also write redirect_to event_path(@event) its a shoe page url
	end

	def new
		@event = Event.new
	end

	def create
		# @event = Event.create(event_params) # when use it then we dont require write @event.save
		@event = Event.new(event_params)# but when use it then we  require write @event.save
		@event.save
		redirect_to @event #we also write redirect_to event_path(@event) its a show page url

	end

	private 
		def event_params
			params.require(:event).permit(:name, :ldescription, :location, :price, :starts_at)
		end 
end
