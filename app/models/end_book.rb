class EndBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id,:book_id,:comments,presence: true
end
