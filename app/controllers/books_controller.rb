class BooksController < ApplicationController
  before_action :authenticate_user! ,only: [:end_book]
  def index;@books = Book.limit(5);end

  def show;@book = Book.find(params[:id]);end
end
