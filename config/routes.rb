Rails.application.routes.draw do
  resources :users, :only => [:show, :create, :update, :destroy]
end
