class Admin::UsersController < ApplicationController
  layout "dashboard"
  before_action :logged_in_user
  before_action :logged_admin, except: :show
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.select(:id, :name, :email, :is_admin).order(created_at: :desc)
      .page(params[:page]).per Settings.users_controllers.per_page
    @user = User.new
  end

  def show
  end

  def edit
    respond_to do |format|
      format.html{render partial: "user_edit_form", locals: {user: @user}}
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_user_success"
    else
      flash[:danger] = t ".create_user_fail"
    end
    redirect_to admin_users_url
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".user_updated_success"
    else
      flash[:danger] = t ".user_updated_fail"
    end
    redirect_to admin_users_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user_nil"
      redirect_to admin_users_url
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :is_admin, :phone
  end
end
