class ArticlesController < ApplicationController
    def show
        @article=Article.find(params[:id])
    end
    
    def new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title,:text,:password))

        @article.save
        redirect_to @article
    end
end