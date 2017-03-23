class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.author.name_size}, uniqueness: true
  validates :description,
    length: {maximum: Settings.author.description_size}

  scope :search_name, lambda{|name| where "name like ?", "%#{name}%"}
end
