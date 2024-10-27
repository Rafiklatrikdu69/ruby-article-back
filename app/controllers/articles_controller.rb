class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end


  skip_before_action :verify_authenticity_token
  def create
    article = Article.new(article_params)

    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @article
  end

  def check
    render json: Article.all , status: :ok
  end
  
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
