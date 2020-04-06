class Book < ApplicationRecord
  has_many :end_books, dependent: :destroy
  
  has_many :users, through: :end_books

  ##function

  def readover?(user)
    self.users.include?(user)
  end

end