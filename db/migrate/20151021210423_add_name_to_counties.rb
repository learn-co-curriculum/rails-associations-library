class AddNameToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :name, :string
  end
end
