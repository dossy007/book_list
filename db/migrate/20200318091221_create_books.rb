class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title,index: true,null: false
      t.string :date,null: false
      t.string :author,null: false
      t.string :summary,null: true
    end
  end
end
