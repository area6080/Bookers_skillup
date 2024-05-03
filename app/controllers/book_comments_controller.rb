class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    unless @book_comment.save
      render 'error'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
  end
  
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

  # def create
  #   book = Book.find(params[:book_id])
  #   comment = current_user.book_comments.new(book_comment_params)
  #   comment.book_id = book.id
  #   comment.save
  #   # redirect_to book_path(book)
  # end
  
  # def destroy
  #   BookComment.find(params[:id]).destroy
  #   # redirect_to book_path(params[:book_id])
  # end