class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end
end