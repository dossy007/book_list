class BooksController < ApplicationController
  def index;@books = Book.limit(5);end

  def show;@book = Book.find(params[:id]);end
end
