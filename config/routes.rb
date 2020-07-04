Rails.application.routes.draw do

 
# after
root 'items#index'
resources :items, only: :show
end
