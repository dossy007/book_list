class EndBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @readover = Book.find(get_book)
    unless @readover.readover?(current_user)
      r = @readover.end_books.new(comments: comments_params,user_id: current_user.id)
      if r.save
        respond_to do |f|
          f.js
        end
      end
    end
  end

end

private

def get_book
  params.require(:end_book)[:book_id]
end

def comments_params
  params.require(:end_book)[:comments]
end

####
# js.erbの使い方を学びviewを実装