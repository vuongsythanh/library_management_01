class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :content,
    length: {maximum: Settings.review.content_size}
end
