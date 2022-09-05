class BooksController < ApplicationController
  def top
  end

  def new
    @book = @Book.all
  end

  def create
    book = Book.new(book_params[:id])
    book.save
    redirect_to'/index'
  end

  def index
    @user = current_user
    @book = Book.new
  end

end
