Rails.application.routes.draw do

devise_for :users, controllers: {
  registrations: 'users/registrations'
}

resources :users, only: [:index,:show,:edit]
# after
root 'items#index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show, :new]

  resources :items do
      member do
      get 'confirm'
      end
    end
end