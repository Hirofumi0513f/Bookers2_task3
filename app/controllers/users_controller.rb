class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookers = @user.books
  end

  def index
  end
  
  def edit
  end

  def update
  end
end
