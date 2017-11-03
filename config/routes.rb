Rails.application.routes.draw do
  resources :menus, except: :update do
    resources :meals,  only: :create
    resources :orders, only: :create
  end

  root to: 'menus#index'
end
