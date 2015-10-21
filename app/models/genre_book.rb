class GenreBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :genre
end
