Rails.application.routes.draw do
  devise_for :users
  root to:  "home#index"
  resources :users
  get "/home/about" =>"home#about"
  resources :books do
    resource :book_comments, only: [:create, :destroy]
    
    resource :favorites, only: [:create, :destroy]
  end
  get	'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
