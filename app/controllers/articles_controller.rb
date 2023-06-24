class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  # New action for creating a new article
  def new
    @article = Article.new
  end
  # Create action saves the article into database
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Successfully created article!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Error creating new article!"
      render :new, status: :unprocessable_entity
    end
  end
  # Edit action retrives the article and renders the edit page
  def edit
    @article = Article.find(params[:id])
  end
  # Update action updates the article with the new information
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = "Successfully updated article!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Error updating article!"
      render :edit, status: :unprocessable_entity
    end
  end
  # Destroy action removes the article permanently from the database
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Successfully deleted article!"
      redirect_to articles_path
    else
      flash[:alert] = "Error updating article!"
    end
  end
  private def article_params
    params.require(:article).permit(:title, :body)
  end
end
