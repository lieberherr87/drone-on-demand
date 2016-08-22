Rails.application.routes.draw do

  resources :operator_profile do
    resources :proposals
  end

  resources :proposals do
    resources :reviews
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "pages#index"
end
