class User < ApplicationRecord
  validates :activation_token, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email,
            :password_digest,
            :session_token,
            :activation_token,
            presence: true

  attr_reader :password

  after_initialize :ensure_session_token
  after_initialize :set_activation_token
end
