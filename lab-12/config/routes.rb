# frozen_string_literal: true

Rails.application.routes.draw do
  root 'calcs#index'
  resources :calcs
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
end
