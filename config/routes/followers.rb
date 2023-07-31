# frozen_string_literal: true

Rails.application.routes.draw do
  get '/search', to: 'followers#search_users'
  post '/follow', to: 'followers#send_follow_request'
  post '/block', to: 'followers#block_user'
  get '/requests', to: 'followers#follow_requests'
  post '/accept', to: 'followers#accept_request'
  post '/reject', to: 'followers#reject_request'
  get '/followers', to: 'followers#followers'
  get '/followings', to: 'followers#followings'
end
