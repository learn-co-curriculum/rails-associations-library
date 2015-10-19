class AddCountyToLibrary < ActiveRecord::Migration
  def change
    add_reference :libraries, :county, index: true, foreign_key: true
  end
end
