class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @word = params[:word]

    if @model == "User"
      @result = User.looks(params[:search], params[:word])
    else
      @result = Book.looks(params[:search], params[:word])
    end
  end
end
