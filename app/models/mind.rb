class Mind < ActiveRecord::Base
  belongs_to :canvas
  has_many :mind_connections, foreign_key: 'base_mind_id'
  attr_accessible :description, :name, :top, :left
end
