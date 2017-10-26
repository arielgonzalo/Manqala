Rails.application.routes.draw do
  resources :invoice_details
  resources :invoices
  resources :table_game_tax_assigments
  resources :food_tax_assigments
  resources :taxes
  resources :rentals
  resources :table_games
  resources :foods
  resources :access_grantings
  resources :library_accesses
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
