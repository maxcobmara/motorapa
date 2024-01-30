Rails.application.routes.draw do
  
  namespace :admin do
    resources :manufacturers
    resources :products
  end
  resources :manufacturers, only: [:index, :show]
  resources :products, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
end
