class BooksController < ApplicationController
  def new
  end

  def create
  end

  def index
    @books = Book.page(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
