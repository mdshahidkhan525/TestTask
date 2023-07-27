# frozen_string_literal: true

module UsersHelper
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def request_count(user)
    user.follow_requests.count
  end
end
