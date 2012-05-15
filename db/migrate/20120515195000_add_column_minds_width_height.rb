class AddColumnMindsWidthHeight < ActiveRecord::Migration
  def self.up
    add_column :minds, :width, :integer
    add_column :minds, :height, :integer
  end

  def self.down
    remove_colmun :minds, :width
    remove_colmun :minds, :height
  end
end
