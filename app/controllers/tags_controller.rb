class TagsController < ApplicationController
  skip_before_action :authorize, only: %i[index show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(tag: params[:slug])
  end

  def create
    @article = Article.find_by_slug(params[:article_slug])
    @tag = Tag.find_or_create_by(tag_param)

    if @article.tags.include? @tag
      redirect_to edit_article_path(@article)
    else
      @article.tags << @tag
      redirect_to edit_article_path(@article), notice: 'Tag added!'
    end
  end

  def destroy
    @article = Article.find_by_slug(params[:article_slug])
    @tag = Tag.find_by_slug(params[:slug])

    @article.remove_tag(@tag)
    @article.save

    Tag.clean_up_unused_tags

    redirect_to edit_article_path(@article), notice: 'Tag removed!'
  end

  private

  def tag_param
    params.permit(:tag)
  end
end
