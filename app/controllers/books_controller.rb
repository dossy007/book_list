class BooksController < ApplicationController
  before_action :authenticate_user! ,only: [:end_book]
  def index;@books = Book.limit(5);end

  def show;@book = Book.find(params[:id]);end

  private

  def book_params
    params.require(:book).permit(:book_id).merge(user_id: current_user.id)
  end
end
