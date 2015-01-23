Rails.application.routes.draw do
  resources :car_points

  get 'car_search/index'
  get 'car_search/find'

  resources :carsets, only: [:new, :create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #get 'home/index'

  devise_for :users
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root 'home#index'

end
