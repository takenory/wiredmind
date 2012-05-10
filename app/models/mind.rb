class Mind < ActiveRecord::Base
  belongs_to :canvas
  has_many :wires, foreign_key: 'base_mind_id'
  attr_accessible :description, :name, :top, :left
  def move(top, left)
    return false if top.blank? || left.blank?
    self.update_attributes(top: top, left: left)
  end
end
