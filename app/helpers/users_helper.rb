module UsersHelper
  def logged_in_user
    unless logged_in?
      flash[:danger] = t ".user_login"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to admin_users_path unless @user == current_user
  end

  def admin_user
    redirect_to root_path unless current_user.is_admin?
  end
end
