# frozen_string_literal: true

Rails.application.routes.draw do
  get '/search', to: 'followers#search_users'
  post '/follow', to: 'followers#send_follow_request'
  patch '/block', to: 'followers#block_user'
  patch '/unblock', to: 'followers#unblock_user'  
  get '/requests', to: 'followers#follow_requests'
  post '/accept', to: 'followers#accept_request'
  post '/reject', to: 'followers#reject_request'
  get '/followers', to: 'followers#followers'
  get '/followings', to: 'followers#followings'
  patch '/remove_follower', to: 'followers#remove_follower'
end
