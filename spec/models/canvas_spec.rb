require 'spec_helper'

describe Canvas do
  describe 'association' do
    before do
      @canvas = Canvas.create(name: 'canvas')
      @mind_count = 5
      @minds = @mind_count.times.collect do |i|
                 mind = Mind.create(name: "mind_#{i}")
                 mind.canvas_id = @canvas.id
                 mind.save
               end 
    end
    it 'Canvas.#minds returns instance of Array whitch include instance of "Mind"' do
      @canvas.minds.should have(@mind_count).items
      @canvas.minds.each do |mind|
        mind.should be_instance_of Mind
      end
    end
  end
end
