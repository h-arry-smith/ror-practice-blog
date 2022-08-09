class TagsController < ApplicationController
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

  private

  def tag_param
    params.permit(:tag)
  end
end
