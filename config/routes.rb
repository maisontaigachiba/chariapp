Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  get "/about" => "home#about"
  get "/contact" => "home#contact"
  resources :users
  resources :bikes do
    resource :favorites, only: [:create, :destroy]
  end
end
