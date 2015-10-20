class AddBookIdToBookAuthors < ActiveRecord::Migration
  def change
    add_reference :book_authors, :book, index: true, foreign_key: true
  end
end
