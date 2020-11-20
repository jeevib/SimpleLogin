Rails.application.routes.draw do
	root 'sessions#login'
  get '/login' => 'sessions#login', as: 'login'
  post '/login' => 'sessions#create'
  get 'customers/create' => 'customers#create'
  post 'customers/create' => 'customers#create'
end
