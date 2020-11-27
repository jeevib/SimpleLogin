Rails.application.routes.draw do
	root 'sessions#login'

  #session login and logout
  get '/login' => 'sessions#login', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #customers controller
  get 'customers/new' => 'customers#new'
  post 'customers/create' => 'customers#create'
  get '/home' => 'customers#home'
  get 'customers/index' => 'customers#index'
  get 'customers/show/:id' => 'customers#show', as: 'customers_show'
  get 'customers/edit/:id' => 'customers#edit', as: 'customers_edit'
  patch 'customers/update' => 'customers#update', as: 'customers_update'
  delete 'customers/destroy/:id' => 'customers#destroy', as: 'customers_destroy'
  # post 'customers/resume_upload/:id' => 'customers#resume_upload', as: 'customer_resume_upload'
  # delete 'customers/remove_resume/:id' => 'customers#remove_resume', as: 'customer_resume_remove'

  #sidekiq
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
end
