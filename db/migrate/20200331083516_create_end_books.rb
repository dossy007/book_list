class CreateEndBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :end_books do |t|
      t.references :user
      t.references :book
      t.timestamps
    end
  end
end
