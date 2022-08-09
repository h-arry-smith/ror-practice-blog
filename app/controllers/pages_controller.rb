class PagesController < ApplicationController
  def home
    @page = Page.find_by(title: "Home")
    @recent = Article.last
  end

  def about
    @page = Page.find_by(title: "About")
  end
end
