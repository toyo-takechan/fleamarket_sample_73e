Rails.application.routes.draw do

devise_for :users
# after
root 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:edit, :update, :index, :destroy]
resources :profiles, only: [:index]

resources :items, only: :show

resources :items do
    member do
    get 'confirm'
    end
  end

resources :users do
  member do
    get 'logout'
  end
end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
