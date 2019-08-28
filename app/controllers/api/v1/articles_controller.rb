module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        @articles = Article.all
        render json: @articles, status: :ok
      end

      def create
        @article = Article.new(article_params)
        @article.save
        render json: @article, status: :created
      end

      def show
        @article = Article.find(params[:id])
        render json: @article, status: :ok
      end

      def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        render json: @article, status: :ok
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        render json: @article, status: :ok
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :image_url)
      end
    end
  end
end
