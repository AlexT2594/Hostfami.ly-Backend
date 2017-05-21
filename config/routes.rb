Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update]
  post "login" => "authentication#authenticate_user"
  get "home" => "home#index"
  get "confirm_email" => "users#confirm_email"
end
