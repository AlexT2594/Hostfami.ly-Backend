Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :index] do
    resources :post
  end

  resources :events, only: [:create,:show,:index]

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

  post "my_description" => "my_description#create"
  get "my_description" => "my_description#show"

  post "request" => "request#create"
  get "request" => "request#index"
  patch "request" => "request#update"
  delete "request/:id" => "request#delete"

  get "data" => "data#show"
end
