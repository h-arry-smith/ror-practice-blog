class AdminController < ApplicationController
  before_action :change_default_password, only: %i[index]
  before_action :get_super_user, only: %I[change_password update_password]

  def index
    @articles = Article.order(created_at: :desc).all
  end

  def change_password
  end

  def update_password
    if @user.update(password_params)
      @user.update(default_password: false)
      redirect_to admin_change_password_url, notice: "Password successfully changed"
    else
      render "change_password", status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:super_user).permit(:password, :password_confirmation)
  end

  def change_default_password
    if super_user.default_password
      redirect_to admin_change_password_url
    end
  end

  def get_super_user
    @user = super_user
  end
end
