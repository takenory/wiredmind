require 'spec_helper'

describe Mind do
  describe 'associations' do
    before do
      @target_mind_count = 5
      @base_mind = Mind.create(name: "base_mind")
      @mind_connections = @target_mind_count.times.collect do |i|
        connection = MindConnection.new
        connection.base_mind_id = @base_mind.id
        connection.target_mind_id = i 
        connection.save
        connection
      end
    end
    it 'Mind#connections should be instance of Array' do
      @base_mind.mind_connections.should have(@target_mind_count).items
      @base_mind.mind_connections.each do |mc|
        mc.should be_instance_of(MindConnection)
      end
    end
  end
  describe 'Mind#move(top:integer, left:integer)' do
    before do
      @mind = Mind.create(name: "test_mind")
      @top, @left = 111, 222
    end
    it { @mind.move(@top, @left).should == true }
    it { @mind.move(@top, nil).should == false }
    it { @mind.move(nil, @left).should == false }
    it "minds.top, minds.left colum value change spacified value" do
      @mind.move(@top, @left)
      @mind.top.should == @top
      @mind.left.should == @left
    end
  end
end
