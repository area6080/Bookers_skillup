class BooksController < ApplicationController
  def new
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @user = User.find(params[:id])
    @books = @user.books
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @book = @user.books.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_book_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    book = @user.books.find(params[:id])
    book.destroy
    redirect_to books_path(@user.id)
  end

  def update

  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

