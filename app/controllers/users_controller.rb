# frozen_string_literal: true

class UsersController < ApplicationController
  def search_users
    query = params[:query]
    @users = User.search(query, match: :word_start, misspellings: { below: 1 },
                                fields: %i[username first_name last_name])
  end

  def my_profile
    @my_posts = current_user.posts
  end
end
