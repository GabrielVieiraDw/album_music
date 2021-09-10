# frozen_string_literal: true

class User < ApplicationRecord
  validates :user_name, :full_name, :password, presence: true
  validates :user_name, uniqueness: true

  def authenticate(password:)
    return true if self.password == password

    raise ArgumentError, 'Password incorrect.'
  end

  def admin?
    role == 'admin'
  end
end
