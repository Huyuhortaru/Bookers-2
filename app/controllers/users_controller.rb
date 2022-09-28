class UsersController < ApplicationController
  before_action :authenticate_user!
    #(ログインしていない状態で他のページに遷移しようとした場合、ログインページに推移する)
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
     #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)

  def index
    @users =User.all
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:notice] = "errors prohibited this obj from being saved:"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  # def ensure_current_user
      # @user = User.find(params[:id])

    # if @user.id != current_user.id
      # redirect_to user_path(current_user.id)
  # end

end
