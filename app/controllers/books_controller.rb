class BooksController < ApplicationController
  before_action :load_book, except: [:index]

  def index
    @books = Book.all
      .order(created_at: :desc)
      .page(params[:page]).per Settings.books.per_page_index
  end

  def show
    respond_to do |format| format.html {render partial: "modal_show_form", locals: {book: @book}}
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
end
