Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
#  Rails.application.routes.draw do
#    devise_for :users, controllers: {
#      sessions: 'users/sessions'
#    }
#  end



  root 'store#index', as: 'store'
#  root "static_pages#home"



  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
