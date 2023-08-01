# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
end
