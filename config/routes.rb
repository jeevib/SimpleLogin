Rails.application.routes.draw do
	root 'sessions#login'

  #session login and logout
  get '/login' => 'sessions#login', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # customers controller
  resources :customers do
    member do
      get :confirm_email
    end
  end
  get 'customers/new' => 'customers#new'
  post 'customers/create' => 'customers#create'
  get '/home' => 'customers#home'
  get '/email_activated' => 'customers#email_activated'
  get 'customers/index' => 'customers#index'
  get 'customers/show/:id' => 'customers#show', as: 'customers_show'
  get 'customers/edit/:id' => 'customers#edit', as: 'customers_edit'
  patch 'customers/update' => 'customers#update', as: 'customers_update'
  delete 'customers/destroy/:id' => 'customers#destroy', as: 'customers_destroy'
  delete 'customers/resume_delete/:id' => 'customers#resume_delete', as: 'customer_resume_delete'

  #webhook
  post '/fetch_customer_details' => 'webhook#fetch_customer_details'

  #sidekiq
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
end
