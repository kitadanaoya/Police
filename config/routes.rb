Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  get 'lps/home'
  root to:  'lps#home'
  resources :users
  
  get '/auth/:provider/callback' => 'sessions#create'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "application#hello"
end
