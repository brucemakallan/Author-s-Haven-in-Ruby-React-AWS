module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        @articles = Article.all
        render json: { status: 200, data: @articles },
               status: :ok
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          render json: { status: 200, data: @article },
                 status: :created
        else
          render json: { status: 422, data: 'Article not created' },
                 status: :unprocessable_entity
        end
      end

      # def show

      # end

      # def update

      # end

      # def destroy

      # end

      private

      def article_params
        params.require(:article).permit(:title, :body, :image_url)
      end
    end
  end
end
