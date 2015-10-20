class CreateLibraryBooks < ActiveRecord::Migration
  def change
    create_table :library_books do |t|

      t.timestamps null: false
    end
  end
end
