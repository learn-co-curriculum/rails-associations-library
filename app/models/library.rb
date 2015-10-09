class Library < ActiveRecord::Base
  belongs_to :country
  has_many :books
  has_many :library_books
  has_many :books, through: :library_books
end
