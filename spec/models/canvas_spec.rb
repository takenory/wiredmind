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
  describe 'Canvas.#generate_mind' do
    before do
      @canvas = Canvas.create(name: 'canvas')
      @mind_count = @canvas.minds.count
      @mind_default_pos_left = 200
      @mind_default_pos_top = 200
    end
    it 'return New Mind Object and spacified default position' do
      mind = @canvas.generate_mind
      mind.should be_instance_of(Mind)
      mind.left.should == @mind_default_pos_left
      mind.top.should == @mind_default_pos_top
    end
    it 'create New Mind Record' do
      @canvas.generate_mind
      @canvas.minds.count.should == @mind_count + 1
    end 
  end
end
