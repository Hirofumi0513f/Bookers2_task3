class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @bookers = @user.books.page(params[:page])
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction)
  end
end
