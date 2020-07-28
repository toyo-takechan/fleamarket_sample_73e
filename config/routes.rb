Rails.application.routes.draw do

devise_for :users, controllers: {registrations: 'users/registrations'}
devise_scope :user do
  get 'addresses', to: 'users/registrations#new_address'
  post 'addresses', to: 'users/registrations#create_address'
end
# after
root 'items#index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new]

  resources :items do
      member do
      get 'confirm'
      end
    end

  resources :users, only: [:show,:edit,:update] do
    member do
      get 'logout'
      patch 'profile_update'
      get 'profile'
    end
    collection do
      get 'ready'
    end
  end
    namespace :items do
      resources :searches, only: [:index,:show]
      
  end

  resources :registration,only: [:index]
  end