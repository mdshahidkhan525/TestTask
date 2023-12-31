# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/signin', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
  end
  get '/search', to: 'users#search_users'
  get '/profile', to: 'users#my_profile'
end
