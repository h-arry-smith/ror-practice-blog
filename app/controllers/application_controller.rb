class ApplicationController < ActionController::Base
  before_action :authorize

  def super_user
    SuperUser.first
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def authorize
    redirect_to login_path unless logged_in?
  end
end
