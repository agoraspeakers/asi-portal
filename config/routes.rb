Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  devise_for :users

  resources :pages, only: [:index]
  resources :clubs do
    member do
      get 'confirm'
    end
  end
end
