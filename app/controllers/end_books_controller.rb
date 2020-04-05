class EndBooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @readover = Book.find(get_book)
    unless @readover.readover?(current_user)
      @readover.readover(current_user)
        respond_to do |f|
          f.js
        end
      end
  end

end

private

def get_book
  params.require(:end_book)[:book_id]
end

####
# js.erbの使い方を学びviewを実装