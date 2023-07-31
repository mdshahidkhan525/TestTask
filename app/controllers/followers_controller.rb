# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :find_user, only: %i[send_follow_request block_user accept_request reject_request]

  def send_follow_request
    current_user.send_follow_request_to(@user)
  end

  def block_user
    current_user.block(@user)
  end

  def follow_requests
    @follow_requests = current_user.follow_requests
  end

  def accept_request
    if current_user.accept_follow_request_of(@user)
      redirect_to requests_path, notice: 'Follow request accepted successfully'
    else
      redirect_to requests_path, alert: 'Failed to accept follow request'
    end
  end

  def reject_request
    if current_user.decline_follow_request_of(@user)
      redirect_to requests_path, notice: 'Follow request rejected successfully'
    else
      redirect_to requests_path, alert: 'Failed to reject follow request'
    end
  end

  def block_user; end

  def remove_follower; end

  def followers
    @followers = current_user.followers
  end

  def followings
    @followings = current_user.following
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
