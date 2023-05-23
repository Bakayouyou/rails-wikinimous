class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path(@articles), status: :see_other
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path(@articles), status: :see_other
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # raise
    @article = Article.find(params[:id])
    # @Article.update(Article_params)
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit_article
    end
  end

  def show
    @article = Article.find(params[:id])
    # raise
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
