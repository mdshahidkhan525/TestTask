Rails.application.routes.draw do
  get '/search', to: 'followers#search_users'
  post '/follow', to: 'followers#send_follow_request'
  post '/block', to: 'followers#block_user'
end
