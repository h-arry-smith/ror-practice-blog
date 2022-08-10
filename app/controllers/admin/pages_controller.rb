class Admin::PagesController < ApplicationController
  layout 'admin'

  before_action :get_page, only: %i[edit update]

  def index
    @pages = Page.all
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to edit_admin_page_url(@page), notice: "Page updated!"
    else
      render "edit", status: :unprocessable_entity, layout: "admin"
    end
  end

  private

  def page_params
    params.require(:page).permit(:body)
  end

  def get_page
    @page = Page.find(params[:id])
  end
end
