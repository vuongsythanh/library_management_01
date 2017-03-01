class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :name).order(:name).includes(:books)
      .page(params[:page]).per(Settings.categories.categories_per_page)
  end
end
