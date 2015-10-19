class Book < ActiveRecord::Base
  belongs_to :genre
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :library_books
  has_many :libraries, through: :library_books

  has_many :checkouts
end
