module UsersHelper
  def logged_in_user
    unless logged_in?
      flash[:danger] = t ".user_login"
      redirect_to login_path
    end
  end

  def logged_admin
    if current_user.is_admin?
      flash[:success] = t "admin_welcome"
    else
      redirect_to root_path
    end
  end
end
