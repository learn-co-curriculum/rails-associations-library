class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :dewey_decimal  
      t.integer :genre_id
      t.integer :topic_id
      t.integer :author_id
      t.integer :library_id
 
      t.timestamps null: false
    end
  end
end