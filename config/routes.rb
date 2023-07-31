# frozen_string_literal: true

Rails.application.routes.draw do
  root 'feeds#index'
  draw :users
  draw :followers
end
