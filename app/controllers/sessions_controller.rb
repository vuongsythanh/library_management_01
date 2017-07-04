class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] = "1" ? remember(user) : forget(user)
      flash[:success] = t ".login_success"
      respond_to do |format|
        format.json {render json: {error: false}}
      end
    else
      respond_to do |format|
        format.json {render json: {error: true,
          message: t(".login_fail")}}
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
