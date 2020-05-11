Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users, only: [:create, :edit, :update, :show] do
    resources :opportunities, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :user_qualifications, only: [:index, :edit, :update]
  end

  resources :sessions, only: [:create, :destroy]
  resources :tasks, only: [:destroy]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
 
  
end
