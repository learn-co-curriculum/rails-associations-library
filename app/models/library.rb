class Library < ActiveRecord::Base
  belongs_to :country
  has_many :books
  belongs_to :county
  has_many :library_books
  has_many :books, through: :library_books
end
