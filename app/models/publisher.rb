class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.publisher.name_size}
  validates :address, presence: true,
    length: {maximum: Settings.publisher.address_size}
  validates :phone, presence: true,
    length: {maximum: Settings.publisher.phone_size}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: Settings.publisher.email_size}
  validates :description,
    length: {maximum: Settings.publisher.description_size}

  scope :search_name, lambda{|name| where "name like ?", "%#{name}%"}
end
