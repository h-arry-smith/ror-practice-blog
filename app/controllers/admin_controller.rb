class AdminController < ApplicationController
  before_action :change_default_password, only: %i[index]

  def index
    @articles = Article.order(created_at: :desc).all
  end

  def change_password
    @user = super_user
  end

  def update_password
    @user = super_user

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
end
