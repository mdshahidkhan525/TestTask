# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    @posts = Post.all
  end
end
