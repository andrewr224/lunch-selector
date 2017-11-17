Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :menus, except: :update do
      resources :meals,  only: :create
      resources :orders, only: [:create, :edit, :update, :destroy]
    end
    root to: 'menus#index'
  end
end
