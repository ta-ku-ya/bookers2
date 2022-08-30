class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  def show
    @user =  User.find(params[:id])
    @books = @user.books
  end
  def index
    @users = User.all

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
        　if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     flash[:notice]="User was successfully updated."
     redirect_to user_path(@user.id)
    else
     render :edit
  end
 end

 private
  def user_params
  params.require(:user).permit(:name, :introduction)
  end


end
