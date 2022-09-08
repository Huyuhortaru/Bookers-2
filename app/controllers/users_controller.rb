class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:title,:introduction,:profile_image)
  end
end
