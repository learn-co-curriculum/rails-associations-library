class AddGenreIdToGenreBooks < ActiveRecord::Migration
  def change
    add_reference :genre_books, :genre, index: true, foreign_key: true
  end
end
