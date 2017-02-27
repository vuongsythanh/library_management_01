class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      flash[:success] = t ".user_logged"
      log_in user
      redirect_to root_path
    else
      flash[:danger] = t ".user_fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
