class CreateMemberCheckouts < ActiveRecord::Migration
  def change
    create_table :member_checkouts do |t|
      t.references :member, index: true, foreign_key: true
      t.references :checkout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
