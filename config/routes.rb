Rails.application.routes.draw do
  resources :product_tax_assigments
  resources :invoice_lines
  resources :board_games
  resources :board_game_categories
  resources :passes
  resources :categories do
    
    resources :products

  end
  resources :tables do
    
    resources :orders
  
  end
  resources :invoice_details
  resources :invoices
  resources :taxes
  resources :rentals
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'tables#index'
end
