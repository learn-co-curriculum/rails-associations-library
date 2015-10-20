class CreateGenreBooks < ActiveRecord::Migration
  def change
    create_table :genre_books do |t|

      t.timestamps null: false
    end
  end
end
