class AddDateReturnedToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :date_returned, :date
  end
end
