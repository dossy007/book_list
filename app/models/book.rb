class Book < ApplicationRecord
  has_many :end_books, dependent: :destroy
  
  has_many :users, through: :end_books

end