Rails.application.routes.draw do

devise_for :users, controllers: {
  registrations: 'users/registrations'
}

resources :users, only: [:index,:show,:edit]

resources :users do
 collection do
  get 'mypage'
 end
end
# after
root 'items#index'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:index, :show, :new]

  resources :logout,only: [:index]

  resources :items do
      member do
      get 'confirm'
      end
    end
  end