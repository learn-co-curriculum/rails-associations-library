class AddAuthorIdToBookAuthors < ActiveRecord::Migration
  def change
    add_reference :book_authors, :author, index: true, foreign_key: true
  end
end
