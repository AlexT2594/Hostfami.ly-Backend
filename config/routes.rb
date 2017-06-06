Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :index]
  post "login" => "authentication#authenticate_user"
  get "home" => "home#index"
  get "confirm_email" => "users#confirm_email"

  post "about_me" => "about_me#create"
  get "about_me" => "about_me#show"

  post "educational_background" => "educational_background#create"
  get "educational_background" => "educational_background#show"

  post "health_lifestyle" => "health_lifestyle#create"
  get "health_lifestyle" => "health_lifestyle#show"

  post "passport_info" => "passport_info#create"
  get "passport_info" => "passport_info#show"
end
