class SetLanguageController < ApplicationController
  def english
    I18n.locale = :en
    set_session_and_redirect
  end

  def vietnam
    I18n.locale = :vn
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale # cập nhật ngôn ngữ vào cookies
    redirect_to :back # quay trở lại trang cũ với ngôn ngữ mới cập nhật
    rescue ActionController::RedirectBackError
    redirect_to :root
  end
end
