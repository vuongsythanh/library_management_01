class Admin::UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :admin_user
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.select(:id, :name, :email, :is_admin).page(params[:page])
      .order(create_at: desc)
      .per Settings.users_controllers.per_page
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_user_success"
      redirect_to admin_users_path
    else
      flash[:danger] = t ".create_user_fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :is_admin, :phone
  end
end
