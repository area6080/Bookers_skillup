class BooksController < ApplicationController

  def new
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @book =Book.find(params[:id])
    @user =User.find(@book.user_id)
  end
  
  def edit
    @book =Book.find(params[:id])
    @user =User.find(@book.user_id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.update(update_book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,:user_id)
  end
  
  def update_book_params
    params.require(:book).permit(:title, :body)
  end
end

