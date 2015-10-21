class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :genre_books
  has_many :genres, through: :genre_books

  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :checkouts
end
