# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    Post.create(post_params)
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description).merge(user_id: current_user.id)
  end
end
