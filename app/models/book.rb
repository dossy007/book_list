class Book < ApplicationRecord
  has_many :end_books, dependent: :destroy
  
  has_many :users, through: :end_books

  ##function
  def readover(user)
    end_books.create(user_id: user.id)
  end
  # e.end_books.create(user_id: current_user.id)と同じ意味

  def readover?(user)
    self.users.include?(user)
  end
end

test