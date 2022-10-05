class BooksController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    #(controller内で共通の処理をメソッド化する)
  before_action :correct_user, only: [:edit, :update, :destroy]
    #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)
  
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
    @user = @book.user
    @book_new = Book.new
  end

  def edit
  end

  def update
    if @book.update(book_params)
    flash[:notice] = "You have creatad book successfully."
    redirect_to  book_path(@book.id)

    else
      @books = Book.all
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def set_user
    @book = Book.find(params[:id])
  end
  
  def correct_user
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
  # def correct_user
  # @book = current_user.books.find_by(id: params[:id])
  # redirect_to books_path unless @book
  # end
  # (別の記述方法)
  
end
