class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end
  
  # def create
    
  # end
  
  # def show
    
  # end
  
  # def update
    
  # end
  
  # def destroy
    
  # end
  
end
