class AddAddressAndNameToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :address, :string
    add_column :libraries, :name, :string
  end
end
