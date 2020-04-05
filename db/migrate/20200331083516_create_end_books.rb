class CreateEndBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :end_books do |t|
      t.references :user
      t.references :book
      t.text :comments
      t.timestamps
      
      t.index [:user_id,:book_id],unique: true
    end
  end
end
