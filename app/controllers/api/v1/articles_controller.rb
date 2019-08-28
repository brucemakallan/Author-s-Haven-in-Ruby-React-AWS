module Api
  module V1
    class ArticlesController < ApplicationController
      INVALID_INPUT = 'Invalid Input'.freeze

      def index
        @articles = Article.all
        render json: @articles, status: :ok
      end

      def create
        @article = Article.new(article_params)
        if @article.valid?
          @article.save
          render json: @article, status: :created
        else
          render_error(INVALID_INPUT)
        end
      end

      def show
        @article = Article.find(params[:id])
        render json: @article, status: :ok
      end

      def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        if @article.valid?
          render json: @article, status: :ok
        else
          render_error(INVALID_INPUT)
        end
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

      def render_error(message)
        render json: { error: message, details: @article.errors }, status: :bad_request
      end
    end
  end
end
