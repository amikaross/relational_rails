class AuthorsController < ApplicationController 
  def index 
    if params[:exact_keyword] != nil 
      @authors = Author.exact_matched(params[:exact_keyword])
    elsif params[:partial_keyword] != nil
      @authors = Author.partial_matched(params[:partial_keyword])
    elsif params[:sorted] == "true"
      @authors = Author.sort_by_book_amount
    else 
      @authors = Author.sort_by_creation
    end
  end

  def show 
    @author = Author.find(params[:id])
  end

  def new 
  end

  def create
    author = Author.create(author_params)
    redirect_to "/authors"
  end

  def edit 
    @author = Author.find(params[:id])
  end

  def update 
    author = Author.find(params[:id])
    author.update(author_params)
    redirect_to "/authors"
  end

  def destroy 
    author = Author.find(params[:id])
    author.books.destroy_all
    author.destroy
    redirect_to "/authors"
  end

  private
  def author_params
    params.permit(:name, :dob_year, :country, :active)
  end
end