class ArticlesController < ApplicationController

    def show
    @article = Article.find(params[:id])
    # render json: article

    end

    def index
    @articles = Article.all
    end

    def new
     @article = Article.new
    end

    def create
      @article = Article.new(article_params)
       if @article.save 
        flash[:notice] = "Article was created successfully"
        redirect_to @article
       else 
        render 'new'
      end
    end

    def edit
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => exception
      redirect_to '/public/404.html'
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:notice] = "Article was updated successfully"
        redirect_to @article
      else
       render 'edit'
      end
    end


    private 
    
    def article_params 
     params.require(:article).permit(:title, :description)
    end



end
