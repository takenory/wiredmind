class Mind < ActiveRecord::Base
  belongs_to :canvas
  attr_accessible :description, :name, :top, :left
end
