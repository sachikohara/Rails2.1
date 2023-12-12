Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'edit_account'
      get 'edit_profile'
      put 'update_account' 
      put 'update_profile'
    end
  end

  resources :rooms, only: [:index, :new, :create, :show] do
    collection do
      get :search
    end
  end
end

