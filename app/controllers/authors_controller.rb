class AuthorsController < ApplicationController 
  def index 
    @authors = Author.order(:created_at)
  end

  def show 
    @author = Author.find(params[:id])
  end

  def books_index
    @author = Author.find(params[:id])
    @books = @author.books
  end
end