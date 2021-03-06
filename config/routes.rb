Rails.application.routes.draw do
  devise_for :users
  get 'kitchen/index'
  get 'bar/index'

  resources :product_tax_assigments
  resources :invoice_lines
  resources :board_game_categories do
    get 'admin_index', :on => :collection
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
    get 'detailed_invoice', as: :detailed_invoice
    get  'admin_index', :on => :collection
    get  'invoice_index', :on => :collection
    
    resources :orders do
      member do
            get 'mark_as_served' => "orders#mark_as_served"
            get 'mark_as_completed_bar' => "orders#mark_as_completed_bar"
            get 'mark_as_completed_kitchen' => "orders#mark_as_completed_kitchen"
            get 'mark_as_uncompleted_kitchen' => "orders#mark_as_uncompleted_kitchen"
            get 'mark_as_billable' => "orders#mark_as_billable"
            put 'change_to_invoice' => "orders#change_to_invoice"
          end
    end
    post 'add_to_billeable' => "tables#add_to_billeable"
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
