class ArticlesController < ApplicationController
  layout 'admin', only: %i[new edit]

  before_action :get_article, only: %i[show edit]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article.slug)
    else
      render 'new', status: :unprocessable_entity, layout: 'admin'
    end
  end

  def edit
  end

  def update
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :slug)
  end

  def get_article
    @article = Article.find_by(slug: params[:slug])
  end
end
