Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :index]
  post "login" => "authentication#authenticate_user"
  get "home" => "home#index"
  get "confirm_email" => "users#confirm_email"
  post "about_me" => "student_about_me#create"
end
