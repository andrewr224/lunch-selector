Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :menus, except: :update do
      resources :meals,  only: :create
      resources :orders, only: [:create, :destroy]
    end
    root to: 'menus#index'
  end
end
