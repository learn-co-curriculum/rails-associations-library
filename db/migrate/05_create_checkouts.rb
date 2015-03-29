class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :book_id
      t.integer :reader_id
      t.datetime :start_date
      t.datetime :due_date
      t.boolean :overdue, :default => false
      t.timestamps null: false
    end
  end
end