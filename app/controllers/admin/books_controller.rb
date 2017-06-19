class Admin::BooksController < ApplicationController
  layout "dashboard"
  before_action :load_book, except: [:create, :index]
  before_action :load_book_size, only: :index

  def index
    @books = Book.select(:id, :title, :image, :status,
      :category_id, :publisher_id, :author_id)
      .order(created_at: :desc).page(params[:page])
      .per Settings.books.per_page
  end

  def show
    respond_to do |format|
      format.html{render partial: "modal_show_form", locals: {book: @book}}
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:info] = t ".not_load_book"
      redirect_to admin_books_url
    end
  end

  def load_book_size
    @book_size = Book.all.size
  end
end
