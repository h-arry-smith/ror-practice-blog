class Admin::PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

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
end
