Rails.application.routes.draw do
  devise_for :users
  resources :pictures, only: %i[index update destroy edit new create]
  root 'pictures#index'
end
