class CatsController < ApplicationController
  # Display all cats
  def index
    @cats = Cat.all
  end
  
  # Display individual cat
  def show
    @cat = Cat.find(params[:id])
  end
end