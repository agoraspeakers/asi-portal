Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  resources :pages, only: [:index]

  devise_for :users

  resources :users, only: [:index, :show]
  resources :clubs do
    put "confirm", on: :member
    resources :users, only: [], param: :user_id, controller: :memberships do
      member do
        post   "join"
        put    "confirm"
        delete "resign"
      end
    end
  end
end
