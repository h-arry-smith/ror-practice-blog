class ArticlesController < ApplicationController
  before_action :get_article, only: %i[show edit]
  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  private

  def get_article
    @article = Article.find_by(slug: params[:slug])
  end
end
