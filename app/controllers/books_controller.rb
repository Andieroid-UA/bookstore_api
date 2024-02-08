class BooksController < ApplicationController
    # Go to routes.rb and look for /[title]
    before_action :set_user, only: [:show, :update, :destroy]

    def index
	books = Book.all
		
    render json: books, status: 200
	end 

    def show
    render json: @book, status: 200
    end

    def create
    book = Book.new(book_params)

    if book.save
    render json: book, status: :created
    else
    render json: book.errors, status: :unprocessable_entity
    end
    end

    def update
    if @book.update(book_params)
    render json: @book, status: :ok
    else
    render json: @book.errors, status: :unprocessable_entity
    end
    end  

    def destroy
    if @book.destroy
    render json: nil, status: :ok
    else
    render json: @book.errors, status: :unprocessable_entity
    end
    end

    private

        def set_book
        @book = Book.find(params[:id])
        end

        def book_params
        params.permit(:author, :title)
        end

    end










end
