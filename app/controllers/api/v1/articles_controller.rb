module Api
  module V1
    class ArticlesController < ApplicationController
      INVALID_INPUT = 'Invalid Input'.freeze

      def index
        @articles = Article.page(params[:page].to_i).per(params[:limit].to_i)
        render json: @articles, status: :ok
      end

      def create
        user = JwtDecorder.new(request.headers).authenticate_user
        @article = user.articles.build(article_params)
        if @article.valid?
          @article.save
          render json: @article, status: :created
        else
          render_error(INVALID_INPUT)
        end
      end

      def show
        @article = Article.friendly.find(params[:id])
        render json: @article, status: :ok
      end

      def update
        JwtDecorder.new(request.headers).authenticate_user
        @article = Article.friendly.find(params[:id])
        @article.update(article_params)
        if @article.valid?
          render json: @article, status: :ok
        else
          render_error(INVALID_INPUT)
        end
      end

      def destroy
        JwtDecorder.new(request.headers).authenticate_user
        @article = Article.friendly.find(params[:id])
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
