class CreateMinds < ActiveRecord::Migration
  def change
    create_table :minds do |t|
      t.references :canvas
      t.string :name
      t.text :description
      t.integer :parent_id

      t.timestamps
    end
    add_index :minds, :canvas_id
  end
end
