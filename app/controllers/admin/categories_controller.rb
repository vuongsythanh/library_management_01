class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :name).order(created_at: :desc)
      .includes(:books).page(params[:page])
      .per Settings.categories.per_page
    @category = Category.new
  end

  def new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".create_cat"
      redirect_to admin_categories_url
    else
      flash[:danger] = t ".not_create_cat"
      redirect_to admin_categories_url
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end
end
