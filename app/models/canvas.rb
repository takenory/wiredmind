class Canvas < ActiveRecord::Base
  has_many :minds
  attr_accessible :name
  def generate_mind
    mind = Mind.new(name: 'New Mind', left: 200, top: 200)
    mind.canvas_id = self.id
    mind.save!
    mind
  end
end
