class AddBookIdToGenreBooks < ActiveRecord::Migration
  def change
    add_reference :genre_books, :book, index: true, foreign_key: true
  end
end
