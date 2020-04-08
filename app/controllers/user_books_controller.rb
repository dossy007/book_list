class UserBooksController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.end_books.find_by(params[:book_id])
  end
end