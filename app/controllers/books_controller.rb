class BooksController < ApplicationController
  def new
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:user_id])
  end
  
  def create
    user = User.find(params[:id])
    book = current_user.books.new(user_id: user.id)
    book.user_id = current_user.id
    if book.save
      redirect_to book_path
    else
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
