Rails.application.routes.draw do
  devise_for :users
  # Static pages
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
