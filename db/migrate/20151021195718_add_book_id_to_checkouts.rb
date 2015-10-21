class AddBookIdToCheckouts < ActiveRecord::Migration
  def change
    add_reference :checkouts, :book, index: true, foreign_key: true
  end
end
