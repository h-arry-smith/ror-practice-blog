class AdminController < ApplicationController
  def index
    @articles = Article.all
  end
end
