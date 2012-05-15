class Mind < ActiveRecord::Base
  belongs_to :canvas
  has_many :wires, foreign_key: 'base_mind_id'
  attr_accessible :description, :name, :top, :left, :width, :height
  def move(top, left)
    return false if top.blank? || left.blank?
    self.update_attributes(top: top, left: left)
  end
  def resize(width, height)
    return false if width.blank? || height.blank?
    self.update_attributes(width: width, height: height)
  end
end
