class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
    if params[:sorted] == "true" 
      @books = @books.order(:title)
    end
    if params[:max_word_count] != nil
      number = params[:max_word_count].delete(",").to_i
      @books = @books.max_word_count(number)
    end
  end

  def new 
    @author = Author.find(params[:id])
  end

  def create 
    author = Author.find(params[:id])
    book = author.books.create(book_params)
    redirect_to "/authors/#{author.id}/books"
  end

  def book_params
    params.permit(:title, :genre, :word_count, :part_of_series)
  end
end