Rails.application.routes.draw do

  resources :time_entries

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #get 'home/index'

  devise_for :users
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root 'time_entries#index'

end
