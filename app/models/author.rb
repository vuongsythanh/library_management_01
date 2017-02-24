class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :relationships, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.author.name_size}, uniqueness: true
  validates :description,
    length: {maximum: Settings.author.description_size}
end
