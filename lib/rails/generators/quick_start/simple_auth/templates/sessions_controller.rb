class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      next_url = session[:protected_page] || root_url
      redirect_to next_url, notice: "Logged in!"
    else
      flash.alert = "Email or password is invalid."
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out!"
  end
end
