Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch "capture", to: "pokemons#capture", :as => 'capture' 		# give it the prefix 'capture'
  patch "damage", to: "pokemons#damage", :as => "damage"
  get "pokemons/new", to: "pokemons#new", :as => "new" 				# used so that I have a page to fill in to create a new pokemon
  post "pokemons", to: "pokemons#create" 							# used by simple_form when you click submit
end
