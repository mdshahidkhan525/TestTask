# frozen_string_literal: true

module UsersHelper
  def full_name(user)
    "#{user.first_name.capitalize} #{user.last_name.capitalize}"
  end

  def request_count(user)
    user.follow_requests.count
  end

  def user_name(user)
    user.username
  end

  def user_followers(user)
    user.followers.count
  end
end
