class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  belongs_to :topic

  belongs_to :library
  delegate :county, to: :library

  has_many :checkouts
  has_many :readers, :through => :checkouts
  has_many :author_books
  has_many :authors, through: :author_books
  belongs_to :genre
  has_many :library_books
  has_many :libraries, through: :library_books
end
