class BooksController < ApplicationController
  def index 
    if params[:exact_keyword] != nil 
      @books = Book.exact_matched(params[:exact_keyword])
    elsif params[:partial_keyword] != nil 
      @books = Book.partial_matched(params[:partial_keyword])
    else 
      @books = Book.part_of_series
    end
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

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.permit(:title, :genre, :word_count, :part_of_series)
  end
end