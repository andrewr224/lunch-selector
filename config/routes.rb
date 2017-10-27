Rails.application.routes.draw do
  resources :menus

  root to: 'menus#index'
end
