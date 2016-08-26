Rails.application.routes.draw do

  get '/profile' => 'pages#profile'
  resources :operator_profiles do
    resources :images, only: [:new, :create]
  end

  resources :images, only: :destroy

  resources :requests do
    resources :proposals, only: [:create, :new]
  end

  resources :proposals, except: [:create, :new] do
      resources :reviews
      member do
        post 'accept', to: "proposals#accept"
        post 'decline', to: "proposals#decline"
      end
  end

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "pages#index"
end
