class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.category.name_size}
  validates :description, length: {maximum: Settings.category.description_size}
end
