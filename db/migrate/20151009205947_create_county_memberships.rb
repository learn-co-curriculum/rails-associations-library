class CreateCountyMemberships < ActiveRecord::Migration
  def change
    create_table :county_memberships do |t|
      t.references :county, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
