class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]
    #(controller内で共通の処理をメソッド化する)
  before_action :correct_user, only: [:edit, :update]
    #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)

  def index
    @users =User.all
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = @user.books
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    if @user != current_user
       redirect_to user_path(current_user) 
    end
  end
  
  # def correct_user
      # redirect_to user_path(current_user) if current_user != @user
  # end
  
  # def correct_user
  # if current_user != @user
  #   redirect_to user_path(current_user)
  # # end
  # end
  # (別の記述方法)
end