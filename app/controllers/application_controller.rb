class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_locale

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
