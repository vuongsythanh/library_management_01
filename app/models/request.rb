class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :content,
    length: {maximum: Settings.request.description_size}
  validates :status, presence: true
end
