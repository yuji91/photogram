Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  #resources :pictures, only: %i[index update destroy edit new create]
  #root 'pictures#index'
end
