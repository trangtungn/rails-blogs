# frozen_string_literal: true

Rails.application.routes.draw do
  # Automatically matching entry's url helper based on the `entryable`
  # https://github.com/rails/rails/pull/39341#issuecomment-727252082
  direct :entry do |model|
    route_for model.entryable_name, model.entryable
  end

  resources :tasks do
    member do
      post :toggle
    end
  end

  resources :articles do
    resources :comments do
      member do
        put :archive
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'
  root 'tasks#index'

  resources :quotes
end
