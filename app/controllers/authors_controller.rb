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
    author = Author.new({
      name: params[:author][:name], 
      dob_year: params[:author][:dob_year], 
      country: params[:author][:country], 
      active: params[:author][:active]
      })

    author.save 

    redirect_to "/authors"
  end
end