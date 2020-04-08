class UsersController < ApplicationController
  def index ##一覧
    @users = User.limit(10)
  end

  def show;@user = User.find(params[:id]);end

  def search #検索時
  end

  def user_book
  end
end