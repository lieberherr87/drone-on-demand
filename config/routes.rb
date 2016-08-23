Rails.application.routes.draw do

  get '/profile' => 'pages#profile'
  resources :operator_profiles

  resources :proposals do
    resources :reviews
  end

  resources :requests do
    resources :proposals
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "pages#index"
end
