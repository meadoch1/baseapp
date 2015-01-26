Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #get 'home/index'

  devise_for :users
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  root 'home#index'

end
