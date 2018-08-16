Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get 'lps/home'
  
  root to:  'lps#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "application#hello"
end
