class Admin::AuthorsController < ApplicationController
  before_action :load_author, except: [:create, :index]
  before_action :load_author_size, only: :index

  def index
    @author = Author.new
    if params[:search]
      @authors = Author.all.includes(:books)
        .search_name(params[:search]).order(created_at: :desc)
        .page(params[:page]).per Settings.authors.per_page
    else
      @authors = Author.select(:id, :name).includes(:books)
        .order(created_at: :desc).page(params[:page])
        .per Settings.authors.per_page
    end
  end

  def create
    @author = Author.new author_params
    respond_to do |format|
      if @author.save
        flash[:success] = t ".create_success"
        format.html {redirect_to admin_authors_url}
      else
        flash[:danger] = t ".create_not_success"
        format.html {redirect_to admin_authors_url}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html{
        render partial: "author_edit_form", locals: {author: @author}
      }
    end
  end

  def update
    if @author.update_attributes author_params
      flash[:success] = t ".update_success"
    end
    redirect_to admin_authors_url
  end

  def destroy
    if @author.books.any?
      flash[:danger] = t ".delete_auth_not_success"
    else
      if @author.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_not_success"
      end
    end
    respond_to do |format|
      format.html{redirect_to admin_authors_url}
    end
  end

  private

  def load_author
    @author = Author.find_by id: params[:id]
    flash[:danger] = t ".not_load_author" if @author.nil?
  end

  def author_params
    params.require(:author).permit :name, :description
  end

  def load_author_size
    @authors_size = Author.all.size
  end
end
