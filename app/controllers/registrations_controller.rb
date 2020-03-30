class RegistrationsController < ApplicationController
	before_action :require_signin
	before_action :set_event 

	def index
		@registrations = @event.registrations
	end

	def show
		@registration = Registration.find(params[:id])
	end

	def new
		@registration = @event.registrations.new
	end

	def create
		@registration = @event.registrations.new(registration_params)
		@registration.user = current_user
		if @registration.save
			redirect_to event_registrations_path(@event), notice: "Thanks, you're registered!"
		else
			render :new 
		end
	end

	def edit
		@registration = Registration.find(params[:id])
	end

	def update
		@registration = Registration.find(params[:id])
		if @registration.update(registration_params)
			redirect_to event_registration_path(@event,@registration), notice: "successfully Updated!"
		else
			render :edit
		end
	end

	def destroy
		@registration = Registration.find(params[:id])
		@registration.destroy
		redirect_to event_registrations_path(@event), notice: "Your registration delete successfully"
	end


	private

		def set_event
			@event = Event.find_by!(slug: params[:event_id])
		end

		def registration_params
			params.require(:registration).permit(:how_heard)
		end
end
