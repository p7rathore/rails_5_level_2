Rails.application.routes.draw do
  
  resources :categories
	get "signin" => "sessions#new" 
	resource :session

	get "signup" => "users#new"
	resources :users
  
  root "events#index"
	
#Static routes 	
# 	get "events/past" => "events#index", scope: "past" 
# 	get "events/free" => "events#index", scope: "free"

# #Dynmic routes (3-types)
	# %w(past free recent).each do |scope| #1) with loop
	# 	get "events/#{scope}" => "events#index", scope: scope
	# end
		 	
	# get "events/:scope" => "events#index", constraints:{ scope:/past|free|recent/} #2) type with constraints
	
	get "events/filter/:scope" => "events#index", as: :filtered_events # we asle wirte as: "filtered_events"#3) type 

	resources :events do
		resources :registrations
		resources :likes
	end
	
end
