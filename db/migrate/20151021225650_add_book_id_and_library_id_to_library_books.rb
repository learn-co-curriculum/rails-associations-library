class AddBookIdAndLibraryIdToLibraryBooks < ActiveRecord::Migration
  def change
    add_reference :library_books, :book, index: true, foreign_key: true
    add_reference :library_books, :library, index: true, foreign_key: true
  end
end
