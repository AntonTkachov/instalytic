# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'followers#index'

  resources :followers, only: :index

  namespace :instagram do
    resource :access_token, only: :show
  end
end
