class AddStartDateToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :start_date, :date
  end
end
