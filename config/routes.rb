Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update]
  post "login" => "authentication#authenticate_user"
  get "home" => "home#index"
end
