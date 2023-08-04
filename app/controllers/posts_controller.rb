# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  after_action :is_current_user_post?, only: %i[edit]
  before_action :find_post, only: %i[edit update destroy]

  def create
    Post.create(post_params)
    redirect_to '/'
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to '/'
  end

  def destroy
    @post.destroy!
    redirect_to profile_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def is_current_user_post?
    @post.user.eql?current_user
  end

  def post_params
    params.require(:post).permit(:title, :description).merge(user_id: current_user.id)
  end
end
