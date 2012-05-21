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
  def connect(target_mind)
    return false if self.connected?(target_mind)
    wire = Wire.new
    wire.base_mind_id = self.id
    wire.target_mind_id = target_mind.id
    wire.save!
  end
  def disconnect(target_mind)
    Wire.where(base_mind_id: self.id, target_mind_id: target_mind.id).destroy_all
  end
  def connected?(target_mind)
    Wire.where(base_mind_id: self.id, target_mind_id: target_mind.id).count > 0
  end
end
