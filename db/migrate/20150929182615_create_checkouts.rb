class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.date :start_date
      t.date :date_returned

      t.timestamps
    end
  end
end
