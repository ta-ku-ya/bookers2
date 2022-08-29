class BooksController < ApplicationController
  def index
    @books = Book.all

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice]="Book was successfully created."
     redirect_to books_path
    else
     @books = Book.all
     render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    flash[:notice]="Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
