class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :origin
      t.string :destination
      t.decimal :distance
      t.references :map, index: true

      t.timestamps
    end
  end
end
