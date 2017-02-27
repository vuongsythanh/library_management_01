class Book < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :attach_books, dependent: :destroy

  belongs_to :author
  belongs_to :category
  belongs_to :publisher

  validates :title, presence: true, length: {maximum: Settings.book.title_size}
  validates :description,
    length: {maximum: Settings.book.description_size}
  validates :status, presence: true
  validates :image, presence: true, length: {maximum: Settings.book.image_size}
end
