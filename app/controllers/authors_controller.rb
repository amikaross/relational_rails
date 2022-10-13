class AuthorsController < ApplicationController 
  def index 
    @authors = Author.order(:created_at)
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

  def author_params
    params.permit(:name, :dob_year, :country, :active)
  end
end