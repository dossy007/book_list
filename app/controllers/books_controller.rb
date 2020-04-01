class BooksController < ApplicationController
  before_action :authenticate_user! ,only: [:end_book]
  def index;@books = Book.limit(5);end

  def show;@book = Book.find(params[:id]);end

  def end_book
    @end = EndBook.new(book_params)
    @num = EndBook.where(user_id: current_user.id,book_id: book_params[:book_id])
    if @num.length != 0 ##既にrecordが存在しているならrootへ
      redirect_to :root
    end

    if @end.save

    else
      redirect_to :root
    end
  end

  p
  private

  def book_params
    params.require(:book).permit(:book_id).merge(user_id: current_user.id)
  end
end
