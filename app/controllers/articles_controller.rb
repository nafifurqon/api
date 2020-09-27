class ArticlesController < ApplicationController
    def index
        articles = Article.recent
        render json: articles
    end

    def show
        #@article = Article[:id]
    end
end