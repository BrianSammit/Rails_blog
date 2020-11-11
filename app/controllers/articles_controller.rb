class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])

    end
    
    def find
        @article = Article.find(params[:id])
    end
end
