class AddColumnMindsTopLeft < ActiveRecord::Migration
  def self.up
    add_column :minds, :top, :integer
    add_column :minds, :left, :integer
  end

  def self.down
    remove_colmun :minds, :top
    remove_colmun :minds, :left
  end
end
