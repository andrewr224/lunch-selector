Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'Supplier', at: 'auth'
      resources :orders, only: :index
    end
  end

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :menus, except: :update do
      resources :meals,  only: :create
      resources :orders, only: %i[create edit update destroy]
    end
    get 'users', to: 'users#index'
    root to: 'menus#index'
  end
end
