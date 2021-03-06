# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  validates :name, presence: { string: true }, length: { minimum: 2 }
  validates :password_digest, presence: { string: true }, length: { minimum: 4 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def downcase_email
    self.email = email.downcase
  end

  def self.digest(_string)
    if ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
