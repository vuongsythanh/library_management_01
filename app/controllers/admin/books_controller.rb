class Admin::BooksController < ApplicationController
  before_action :load_book_size, only: :index
  def index
    @books = Book.select(:id, :title, :image, :status,
      :category_id, :publisher_id, :author_id)
      .order(created_at: :desc).page(params[:page])
      .per Settings.books.per_page
  end

  private

  def load_book_size
    @book_size = Book.all.size
  end
end
