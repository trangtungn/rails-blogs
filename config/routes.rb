# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :articles do
    resources :comments do
      member do
        put :archive
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  root 'articles#index'
end
