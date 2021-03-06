# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates_presence_of :user_name, :password_digest, :session_token
    validates_uniqueness_of :user_name, :session_token
    validates :password, length: {minimum: 6}, allow_nil: true

    after_initialize :ensure_session_token

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

    has_many :rental_requests,
        foreign_key: :user_id,
        class_name: :CatRentalRequest

    attr_reader :password

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def self.find_by_credentials(user_name, password)
        user =  User.find_by(user_name: user_name)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
