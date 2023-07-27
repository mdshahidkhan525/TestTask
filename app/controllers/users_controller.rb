# frozen_string_literal: true

class UsersController < ApplicationController
  def search_users
    query = params[:query]
    @users = User.search(query)
  end
end
