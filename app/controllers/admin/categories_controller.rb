class Admin::CategoriesController < ApplicationController
  before_action :load_category, except: [:create,:index]

  def index
    @categories = Category.select(:id, :name).order(created_at: :desc)
      .includes(:books).page(params[:page]).per Settings.categories.per_page
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    respond_to do |format|
      if @category.save
        flash[:success] = t ".create_success"
        format.html{redirect_to admin_categories_url}
      else
        flash[:danger] = t ".create_not_success"
        format.html{redirect_to admin_categories_url}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html{render partial: "category_edit_form", locals: {category: @category}}
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
    end
    redirect_to :back
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_not_success"
    end
    respond_to do |format|
      format.html {redirect_to admin_categories_url}
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
end
