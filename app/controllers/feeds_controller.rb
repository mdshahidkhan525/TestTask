class FeedsController < ApplicationController
  def index
    @posts = Post.all
  end
end
