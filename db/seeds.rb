# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
CSV.foreach('db/book_list.csv',headers: true) do |row|
  Book.create(
    title: row["Title"],
    date: row["Date"],
    author: row["Author"],
    summary: row["Summary"]
  )
end