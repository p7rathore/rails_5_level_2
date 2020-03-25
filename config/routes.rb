Rails.application.routes.draw do
	root "events#index"
	# get "events" => "events#index"
	# get "events/new" => "events#new"
	# get "events/:id" => "events#show", as: "event"
	# get "events/:id/edit" => "events#edit", as: "edit_event"
	# patch "events/:id" => "events#update" # never need to create helper method b/c we reach on show page when click update button so use show helper method

	resources :events
	
end
