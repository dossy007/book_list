class BooksController < ApplicationController
  def index;@books = Book.limit(4);end

  def show;@book = Book.find(params[:id]);end
end
