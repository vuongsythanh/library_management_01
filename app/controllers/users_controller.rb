class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update, :show]

  def index
    @users = User.search(params[:search])
      .order(created_at: :desc)
      .page(params[:page]).per Settings.users_controllers.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".create_user_success"
      respond_to do |format|
        format.json {render json:{error: false}}
      end
    else
      flash[:danger] = t ".create_user_fail"
      respond_to do |format|
        format.json {render json:{error: true,
          message: @user.errors.full_messages}}
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".user_updated_success"
    else
      flash[:danger] = t ".user_updated_fail"
    end
    redirect_to root_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    flash[:danger] = t "user_nil" if @user.nil?
  end

  def user_params
    params.require(:user).permit :name, :email, :address,
      :phone, :password, :password_confirmation
  end
end
