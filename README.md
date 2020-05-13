# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.5.1
* Rails version
  5.2.4.1
* Bundle version
  2.1.4
* System dependencies

book 投稿機能は現時点ではつけない
mypageに過去に読んだ本を年ごとに一覧表示

* Configuration

* k6 test
5minの一般的な負荷test結果
![app k6 io_runs_728398](https://user-images.githubusercontent.com/35597894/81823507-58168200-956f-11ea-905e-7f32bdc37fa0.png)

最初に負荷をかけたtest

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Database creation

* Database setting

## users table
|Column|Type|Option|
|------|----|------|
|name|string|index: true,null: false|
|sex|int|null:false|
|date|date|null:false|

## Assosiation
- has_many :books
- has_many :end_books
- has_many :books, through: :end_books

## books table
|Column|Type|Option|
|------|----|------|
|title|string|index: true,null: false|
|date|date|null: false|
|author|string|null: false|
|summary|string|null :true|

## Assosiation
- has_many :users
- has_many :end_books
- has_many :users, through: :end_books
- has_one :book_images

## end_books table
|Column|Type|Option|
|------|----|------|
|user_id|reference|index:true,null: false|
|book_id|reference|index:true,null: false|

## Assosiation
- belongs_to :users
- belongs_to :books

## book_images table
|Column|Type|Option|
|------|----|------|
|image|string|index:true,null: false|

## Assosiation
- has_one :book


  User  -- End --- Book
                    |
                  Book_image
