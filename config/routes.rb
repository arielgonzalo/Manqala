Rails.application.routes.draw do
  get 'kitchen/index'
  get 'bar/index'

  resources :product_tax_assigments
  resources :invoice_lines
  resources :board_game_categories do

    resources :board_games

  end
  resources :categories do
    get  'admin_index', :on => :collection
  end
  resources :passes
  resources :categories do
    
    resources :products

  end

  resources :tables do
    get  'admin_index', :on => :collection
    get  'invoice_index', :on => :collection
    resources :orders do
      member do
            get 'mark_as_completed_bar' => "orders#mark_as_completed_bar"
            get 'mark_as_completed_kitchen' => "orders#mark_as_completed_kitchen"
          end
    end
  
  end
  resources :invoice_details
  resources :invoices do
    post 'generate_invoice' => "invoices#generate_invoice", :on => :collection
  end
  resources :taxes
  resources :rentals
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'tables#administration'
end
