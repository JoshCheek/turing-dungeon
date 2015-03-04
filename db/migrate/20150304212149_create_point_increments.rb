class CreatePointIncrements < ActiveRecord::Migration
  def change
    create_table :point_increments do |t|
      t.integer :value
      t.text :comment
      t.references :point, index: true

      t.timestamps null: false
    end
    add_foreign_key :point_increments, :points
  end
end
