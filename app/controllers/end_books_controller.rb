class EndBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @readover = Book.find(get_book)
    unless @readover.readover?(current_user)
      @readover.readover(current_user)
      @readover.reload
      # e.end_books.create(user_id: current_user.id)と同じ意味
        respond_to do |f|
          f.html {redirect_to request.referrer || root_url}
          f.js
        end
      end
  end

  def destroy
    e = EndBook.find(params[:id])
    e.destroy
    respond_to do |f|
      f.html {redirect_to request.referrer || root_url}
      f.js
    end
  end
end

private

def get_book
  params.require(:end_book)[:book_id]
end