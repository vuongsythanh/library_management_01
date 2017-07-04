class Admin::UsersController < ApplicationController
  layout "dashboard"
  before_action :logged_in_user, :verify_admin?
  before_action :load_user, only: [:destroy]

  def index
    @users = User.select(:id, :name, :email, :is_admin).order(created_at: :desc)
      .page(params[:page]).per Settings.users_controllers.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin_user_destroy_success"
    else
      flash[:danger] = t "admin_user_destroy_fail"
    end
    redirect_back fallback_location: root_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user_nil"
      redirect_to admin_users_url
    end
  end

end
