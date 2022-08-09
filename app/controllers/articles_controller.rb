class ArticlesController < ApplicationController
  layout 'admin', only: %i[new edit]

  before_action :get_article, only: %i[show edit update]
  def index
    @articles = Article.order(created_at: :desc).all.group_by { |article| article.created_at.year }
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Article created!"
    else
      render 'new', status: :unprocessable_entity, layout: 'admin'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article saved!"
    else
      render 'edit', status: :unprocessable_entity, layout: 'admin'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :slug)
  end

  def get_article
    @article = Article.find_by(slug: params[:slug])
  end
end
