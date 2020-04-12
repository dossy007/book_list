class UserBooksController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @book = @user.end_books.find_by(params[:id])
  end
end