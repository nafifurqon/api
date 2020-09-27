class ArticlesController < ApplicationController
    def index
        articles = Article.all
        render json: articles
    end

    def show
        #@article = Article[:id]
    end
end