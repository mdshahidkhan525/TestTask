# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show]

  def search_users
    query = params[:query]
    @users = User.search(query, match: :word_start, misspellings: { below: 1 },
                                fields: %i[username first_name last_name])
  end

  def my_profile
    @posts = current_user.posts.order(created_at: :desc)
  end

  def show_profile
    @posts = @user.posts.order(created_at: :desc)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
