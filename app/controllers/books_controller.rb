class BooksController < ApplicationController
  def index
    @books = Book.limit(4)
    @subbooks = Book.where("id > ? and id < ?", 4, 8) ##4超過8未満
  end

  def show;@book = Book.find(params[:id]);end
end
