# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  validates :email, :password_digest, presence: true
end
