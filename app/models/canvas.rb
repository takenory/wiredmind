class Canvas < ActiveRecord::Base
  has_many :minds
  attr_accessible :name
end
