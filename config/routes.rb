Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :searches
  resources :review_users
  resources :review_lodgings
  resources :reservations
  resources :reports
  resources :messages
  resources :users
  resources :lodgings

  resources :users do
    resources :lodgings, shallow: true
  end
  resources :users do
    resources :reservations, shallow: true
  end
  resources :users do
    resources :review_users, shallow: true
  end
  resources :users do
    resources :review_lodgings, shallow: true
  end
  resources :users do
    resources :messages, shallow: true
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :lodgings
      end
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lodgings
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

end
