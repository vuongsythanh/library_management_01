class Admin::PublishersController < ApplicationController
  layout "dashboard"
  before_action :load_publisher, except: [:create,:index]
  before_action :load_publisher_size, only: :index

  def index
    @publisher = Publisher.new
    if params[:search]
      @publishers = Publisher.all.includes(:books)
        .search_name(params[:search]).order(created_at: :desc)
        .page(params[:page]).per Settings.publisher.per_page
    else
      @publishers = Publisher.select(:id, :name, :email).includes(:books)
        .order(created_at: :desc).page(params[:page])
        .per Settings.publisher.per_page
    end
  end

  def show
    respond_to do |format|
      format.html{render partial: "modal_show_form",
        locals: {publisher: @publisher}}
    end
  end

  def edit
    respond_to do |format|
      format.html{render partial: "publisher_edit_form",
        locals: {publisher: @publisher}
      }
    end
  end

  def create
    @publisher = Publisher.new publisher_params
    respond_to do |format|
      if @publisher.save
        flash[:success] = t ".create_success"
        format.html {redirect_to admin_publishers_url}
      else
        flash[:danger] = t ".create_not_success"
        format.html {redirect_to admin_publishers_url}
      end
    end
  end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_not_success"
    end
    redirect_to admin_publishers_url
  end

  def edit
    respond_to do |format|
      format.html{render partial: "publisher_edit_form"}
    end
  end

  def destroy
    if @publisher.books.any?
      flash[:danger] = t ".delete_pub_not_success"
    else
      if @publisher.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_not_success"
      end
    end
    respond_to do |format|
      format.html {redirect_to admin_publishers_url}
    end
  end

  private

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    flash[:info] = t ".not_load_publisher" if @publisher.nil?
  end

  def publisher_params
    params.require(:publisher).permit :name, :address, :phone, :email, :description
  end

  def load_publisher_size
    @publisher_size = Publisher.all.size
  end
end
