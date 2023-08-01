# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :find_user, except: %i[follow_requests followers followings]

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

  def block_user
    if current_user.block(@user)
      if current_user.following? @user
        remove_user_from_following?
      elsif current_user.followers.include? @user
        remove_user_from_followers?
      end
      redirect_to followers_path, notice: 'Blocked successfully!!'
    else
      redirect_to followers_path, notice: 'Failed to Block!!'
    end
  end

  def unblock_user
    if current_user.unblock(@user)
      redirect_to followers_path, notice: 'Unblocked successfully!!'
    else
      redirect_to followers_path, notice: 'Failed to Unblock!!'
    end
  end

  def remove_follower
    if remove_user_from_followers?
      redirect_to followers_path, notice: 'Unfollow successfully!!'
    else
      redirect_to followers_path, notice: 'Failed to remove!!'
    end
  end

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

  def remove_user_from_followers?
    Followability::Relationship.find_by(followable_id: current_user, followerable_id: @user).destroy!
  end

  def remove_user_from_following?
    Followability::Relationship.find_by(
      followerable_type: current_user.class.name,
      followerable_id: current_user.id,
      followable_type: @user.class.name,
      followable_id: @user.id
    ).destroy!
  end
end
