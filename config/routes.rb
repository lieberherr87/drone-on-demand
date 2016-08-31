Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get 'payments/new'

  resources :conversations do
    resources :messages
  end

  get '/profile' => 'pages#profile'
  get '/about' => 'pages#about'

  resources :operator_profiles do
    resources :images, only: [:new, :create]
  end

  resources :images, only: :destroy

  resources :requests do
    resources :proposals, only: [:create, :new]
  end

  resources :proposals, except: [:new] do
      resources :reviews
      member do
        post 'accept', to: "proposals#accept"
        post 'decline', to: "proposals#decline"
      end
      resources :payments, only: [:new, :create]
  end

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#index"
end
