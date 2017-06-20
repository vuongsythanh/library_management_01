class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :relationships
  attr_accessor :remember_token

  validates :name, presence: true, length: {maximum: Settings.user.name_size}
  validates :password_digest, presence: true,
    length: {maximum: Settings.user.password_digest_size}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: Settings.user.email_size}, uniqueness: true
  validates :address, length: {maximum: Settings.user.address_size}
  validates :phone, length: {maximum: Settings.user.phone_size}
  validates :avatar, length: {maximum: Settings.user.avatar_size}

  has_secure_password

  before_save :downcase_email

  scope :search, lambda {|search|
    where "name LIKE ? OR email LIKE ?",
      "%#{search.squish}%", "%#{search.squish}%" if search.present?
  }

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def is_user? user
    self == user
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
