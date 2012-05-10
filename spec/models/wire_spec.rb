require 'spec_helper'

describe Wire do
  describe 'associations' do
    before do
      @mind_count = 5
      @base_mind = Mind.create(name: "base_mind")
      @target_minds = @mind_count.times.collect {|i| Mind.create(name: "mind_#{i}")}
      @wires = @target_minds.collect do |mind|
        wire = Wire.new
        wire.base_mind_id = @base_mind.id
        wire.target_mind_id =  mind.id
        wire.save
        wire 
      end
    end
    it 'Wire#target_mind return an instance of Mind' do
      @wires.each do |wire|
        wire.target_mind.should be_instance_of(Mind)
      end
    end
  end
end
