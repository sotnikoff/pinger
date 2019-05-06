# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false do
    devise_for :users
    resources :nodes do
      get 'ping', action: 'ping', on: :member
    end
  end
  root 'nodes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
