# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :user
end
