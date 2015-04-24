Rails.application.routes.draw do

  resources :clients

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get "client_signup", to: "client_signup_forms#new"
  post "client_signup", to: "client_signup_forms#create"

  get 'client_search/index'
  get 'client_search/find'

  root 'home#index'

end
