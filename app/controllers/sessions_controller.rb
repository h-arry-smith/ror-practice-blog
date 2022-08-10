class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
  end

  def create
    if super_user.authenticate(params[:password])
      session[:user_id] = super_user.id
      redirect_to admin_url
    else
      redirect_to login_url, notice: "Incorrect Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out"
  end
end
