class BooksController < ApplicationController
  def index;@books = Book.limit(5);end

  def show;@book = Book.fid(params[:id]);end
end
