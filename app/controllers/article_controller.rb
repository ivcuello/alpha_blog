class ArticleController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    # Show article
    @article = Article.find(params[:id])
  end

end