Rails.application.routes.draw do
  resources :menus do
    resources :meals
  end

  root to: 'menus#index'
end
