Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'backend/user/edit', to: 'backend/registrations#edit'
    put 'backend/users', to: 'backend/registrations#update'
  end

  namespace :backend do
    resources :dashboard, only: [:index]
    resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :sliders, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :site_identities, only: [:index, :edit, :update]
    resources :store_profiles, only: [:index, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    root to: 'dashboard#index'

  end
  scope module: 'frontend' do
    resources :home, path: 'p', only: [:index, :show] do
      get 'profile', on: :collection
    end
    resources :categories, path: 'c', only: [:show]
    root to: 'home#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
