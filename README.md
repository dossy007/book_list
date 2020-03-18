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

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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