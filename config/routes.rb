Rails.application.routes.draw do
  resources :media
  devise_for :users
  
  namespace :admin do
    resources :manufacturers
    resources :products do
      member do
        get :clone
      end
    end
  end
  resources :manufacturers, only: [:index, :show]
  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "/about", to: "pages#about"
  get "/landing", to: "pages#home"
  root to: "pages#home"
  #root to: "pages#coming_soon"
  
end
