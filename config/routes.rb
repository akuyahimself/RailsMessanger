# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :rooms, only: %i[show create], param: :title
  resources :messages, only: :create do
    member { post :like }
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'rooms#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
