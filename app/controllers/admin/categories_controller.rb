class Admin::CategoriesController < ApplicationController
  layout "dashboard"
  before_action :load_category, except: [:create,:index]
  before_action :load_category_size, only: :index
  before_action :verify_admin?

  def index
    @category = Category.new
    if params[:search]
      @categories = Category.all.includes(:books)
        .search_name(params[:search]).order(created_at: :desc)
        .page(params[:page]).per Settings.categories.per_page
    else
      @categories = Category.select(:id, :name).includes(:books)
        .order(created_at: :desc).page(params[:page])
        .per Settings.categories.per_page
    end
  end

  def show
    @category_book = @category.books.order(created_at: :desc)
      .page(params[:page]).per Settings.categories.per_page
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        flash.now[:success] = t ".create_success"
        format.html{redirect_to admin_categories_url}
      else
        flash[:danger] = t ".create_not_success"
        format.html{redirect_to admin_categories_url}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html{
        render partial: "category_edit_form", locals: {category: @category}
      }
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
    end
    redirect_to admin_categories_url
  end

  def destroy
    if @category.books.any?
      flash[:danger] = t ".delete_cate_not_success"
    else
      if @category.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_not_success"
      end
    end
    respond_to do |format|
      format.html{redirect_to admin_categories_url}
    end
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    flash[:info] = t ".not_load_category" if @category.nil?
  end

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category_size
    @category_size = Category.all.size
  end
end
