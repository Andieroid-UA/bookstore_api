class AuthorsController < ApplicationController
    
    before_action :set_user, only: [:show, :update, :destroy]

    def index
    authors = Author.all
    
    render json: authors, status: 200
    end

    def show
    render json: @author, status: 200
    end
  
    def create
      author = Author.new(author_params)
  
      if author.save
      render json: author, status: :created
      else
      render json: author.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @author.update(author_params)
      render json: @author, status: :ok
      else
      render json: @author.errors, status: :unprocessable_entity
      end
    end  
  
    def destroy
      if @author.destroy
      render json: nil, status: :ok
      else
      render json: @author.errors, status: :unprocessable_entity
      end
    end
  
    private
  
        def set_author
        @author = Author.find(params[:id])
        end
    
        def author_params
        params.permit(:name)
        end
end
