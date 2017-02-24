class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_may :activities, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :relationships, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user.name_size}
  validates :password_digest, presence: true,
    length: {maximum: Settings.user.password_digest_size}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: Settings.user.email_size}, uniqueness: true
  validates :address,
    length: {maximum: Settings.user.address_size}
  validates :phone, presence: true, length: {maximum: Settings.user.phone_size}
  validates :avatar,
    length: {maximum: Settings.user.avatar_size}
  validates :is_admin, presence: true

  has_secure_password
end
