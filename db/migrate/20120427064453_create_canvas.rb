class CreateCanvas < ActiveRecord::Migration
  def change
    create_table :canvas do |t|
      t.string :name

      t.timestamps
    end
  end
end
