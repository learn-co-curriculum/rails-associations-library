class Author < ActiveRecord::Base
  has_many :books
  has_many :readers, :through => :books
  has_many :author_books
end