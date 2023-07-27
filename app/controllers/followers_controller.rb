class FollowersController < ApplicationController
  before_action :find_user, only: %i[send_follow_request block_user]

  def send_follow_request
    current_user.send_follow_request_to(@user)
  end

  def block_user
    current_user.block(@user)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
