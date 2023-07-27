Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    get '/signin', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
  end

  root 'feeds#index'
end
