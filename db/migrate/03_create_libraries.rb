class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.integer :county_id
      t.text :address
      t.string :name
      t.timestamps null: false
    end
  end
end