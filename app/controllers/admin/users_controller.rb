class Admin::UsersController < ApplicationController
  layout "dashboard"
  before_action :logged_in_user, :verify_admin?
  before_action :load_user, only: :destroy
  before_action :verify_admin?

  def index
    @users = User.select(:id, :name, :email, :created_at).search(params[:search])
      .order(created_at: :desc)
      .page(params[:page]).per Settings.users_controllers.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".user_destroy_success"
    else
      flash[:danger] = t ".user_destroy_fail"
    end
    redirect_back fallback_location: root_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    render_404 unless @user
  end

end
