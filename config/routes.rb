Rails.application.routes.draw do
  resources :product_tax_assigments
  resources :invoice_lines
  resources :board_games
  resources :board_game_categories
  resources :categories
  resources :tables do
    
    resources :orders do
      resources :products
      resources :passes

  
  end
  resources :invoice_details
  resources :invoices
  resources :taxes
  resources :rentals
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'tables#index'
end
