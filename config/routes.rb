Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  get 'images/new'

  get 'images/create'

  get 'videos/new'

  get 'videos/create'

  get 'proposals/index'

  get 'proposals/show'

  get 'proposals/new'

  get 'proposals/create'

  get 'proposals/edit'

  get 'proposals/update'

  get 'proposals/destroy'

  get 'operator_profiles/index'

  get 'operator_profiles/show'

  get 'operator_profiles/new'

  get 'operator_profiles/create'

  get 'operator_profiles/edit'

  get 'operator_profiles/update'

  get 'operator_profiles/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "pages#index"
end
