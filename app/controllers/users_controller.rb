class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    # 「_user.html.erb」の最後のリンクに使用している定義の変数は@userfから持ってきている
    @userf = User.find(params[:id])
    @books = @userf.books
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @userf = User.find(params[:id])
    # if @userf.id.to_i != current_user.id
      # redirect_to user_path(@userf.id)
    # end
    unless current_user.id
      redirect_to user_path(@userf.id)
    end
  end

  def update
    @userf = User.find(params[:id])
    if @userf.update(user_params)
      flash[:notice] = "You have updated user profile successfully."
      redirect_to user_path(@userf.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image, :introduction)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end
end
