class BooksController < ApplicationController
  
  # before_action :correct_user, only: [:edit, :update, :destroy]
  
  def top
  end

  def new
    @book = @Book.all
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "You have created book successfully."
    	redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
  	  render :index
    end
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
    flash[:notice] = "You have creatad book successfully."
    redirect_to  book_path(@book.id)

    else
      @books = Book.all
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  # def correct_user
    # @book = Book.find(params[:id])
    # @user = @book.user
    # redirect_to(books_path) unless @user == current_user
  # end
  
end
