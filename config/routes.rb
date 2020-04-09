Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users, only: [:new, :create, :show] do
    resources :opportunities, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :qualifications, only: [:index, :new, :create]

  resources :user_qualifications, only: [:index, :new, :create, :update, :destroy]

end
