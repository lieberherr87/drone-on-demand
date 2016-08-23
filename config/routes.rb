Rails.application.routes.draw do

  resources :operator_profiles

  resources :requests do
    resources :proposals, only: [:create, :new]
  end

  resources :proposals, except: [:create, :new] do
      resources :reviews
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "pages#index"
end
