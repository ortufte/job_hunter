Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/signup', to: 'users#new'

  post '/users', to: 'users#create'

  get '/home', to: 'users#show'

  get '/login', to: 'sessions#new'

  post '/sessions', to: 'sessions#login'

  get '/logout', to: 'sessions#logout'

end
