Rails.application.routes.draw do

#below specifies devise to setup the routes for the users model, and that the specific controllers sessions, and registrations will receive an override
#use the sessions controller inside the users direction of the controllers dirrectory

#the routes for devise users, we want these specific controllers to look in these folders for specifc code (before_action items)
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
