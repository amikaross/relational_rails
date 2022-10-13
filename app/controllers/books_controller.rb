class BooksController < ApplicationController
  def index 
    @books = Book.all
  end

  def show 
    @book = Book.find(params[:id])
  end

  def edit 
    @book = Book.find(params[:id])
  end

  def update 
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books"
  end

  def book_params
    params.permit(:title, :genre, :word_count, :part_of_series)
  end
end