class CreateMindConnections < ActiveRecord::Migration
  def change
    create_table :mind_connections do |t|
      t.integer :base_mind_id
      t.integer :target_mind_id
      t.integer :cpx
      t.integer :cpy
      t.string :caption

      t.timestamps
    end
  end
end
