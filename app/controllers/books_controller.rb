class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create
  end
  def show
  end

  def edit
  end
end
