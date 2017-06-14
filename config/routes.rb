Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :index] do
  end

  resources :post

  resources :event, only: [:create,:show,:index,:update,:destroy]

  post "request" => "request#create"
  get "request" => "request#show"
  get "request/:type/:status" => "request#index"
  put "request/:id" => "request#update"
  delete "request/:id" => "request#destroy"
  post "associate_request" => "request#associate_request"

  post "login" => "authentication#authenticate_user"
  get "home" => "home#index"
  get "confirm_email" => "users#confirm_email"

  post "about_me" => "about_me#create"
  get "about_me" => "about_me#show"
  get "about_me/:student_id" => "about_me#of_student"

  post "educational_background" => "educational_background#create"
  get "educational_background" => "educational_background#show"
  get "educational_background/:student_id" => "educational_background#of_student"

  post "health_lifestyle" => "health_lifestyle#create"
  get "health_lifestyle" => "health_lifestyle#show"

  post "passport_info" => "passport_info#create"
  get "passport_info" => "passport_info#show"

  post "my_description" => "my_description#create"
  get "my_description" => "my_description#show"

  get "data" => "data#show"

  post "country" => "program_preference#create"
  get "country" => "program_preference#show"

  get "incoming_students" => "request#incoming_students"

  post "sms_notification/:cell/:status" => "sms_notification#send_sms"

end
