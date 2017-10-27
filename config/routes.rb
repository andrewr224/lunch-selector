Rails.application.routes.draw do
  resources :menus do
    resources :meals
    resources :orders
  end

  root to: 'menus#index'
end
