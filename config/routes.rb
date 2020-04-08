Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"
  resources :books, only: [:index,:show] do
  end
  resources :end_books, only: [:create]
  resources :users, only: [:index,:show] do
    collection do
      get "search"
    end
    resources :user_books,only: [:show]
  end
end
