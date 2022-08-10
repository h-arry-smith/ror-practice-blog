class TagsController < ApplicationController
  skip_before_action :authorize, only: %i[index show]
  before_action :get_tag_from_slug, only: %i[show destroy]
  before_action :get_article_from_slug, only: %i[create destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def create
    @tag = Tag.find_or_create_by(tag_param)

    if @article.tags.include? @tag
      redirect_to edit_article_path(@article)
    else
      @article.tags << @tag
      redirect_to edit_article_path(@article), notice: 'Tag added!'
    end
  end

  def destroy
    @article.remove_tag(@tag)

    if @article.save
      Tag.clean_up_unused_tags
      redirect_to edit_article_path(@article), notice: 'Tag removed!'
    else
      redirect_to edit_article_path(@article), notice: 'Something went wrong!'
    end
  end

  private

  def get_tag_from_slug
    @tag = Tag.find_by_slug(params[:slug])
  end

  def get_article_from_slug
    @article = Article.find_by_slug(params[:article_slug])
  end

  def tag_param
    params.permit(:tag)
  end
end
