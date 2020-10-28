class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # Show article
  end

  def new
    # New article form
    @article = Article.new
  end

  def edit
  end

  def create
    # Creates an article
    @article = Article.new(article_params)
    @article.user_id = User.first.id
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article.user_id = User.first.id
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end