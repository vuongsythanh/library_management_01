class AttachBook < ApplicationRecord
  belongs_to :book

  validates :publish_date, presence: true
  validates :number_page, presence: true
  validates :limit_date, presence: true
  validates :description,
    length: {maximum: Settings.attach_book.description_size}
end
