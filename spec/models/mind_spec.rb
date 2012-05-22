require 'spec_helper'

describe Mind do
  describe 'associations' do
    before do
      @target_mind_count = 5
      @target_minds = []
      @base_mind = Mind.create(name: "base_mind")
      @wires = @target_mind_count.times.collect do |i|
        wire = Wire.new
        wire.base_mind_id = @base_mind.id
        @target_minds << Mind.create
        wire.target_mind_id = @target_minds.last.id
        wire.save
        wire
      end
    end
    it 'Mind#wires should be instance of Array' do
      @base_mind.wires.should have(@target_mind_count).items
      @base_mind.wires.each do |mc|
        mc.should be_instance_of(Wire)
      end
    end
    it 'Mind#wired_wires should be instance of Array' do
      @target_minds.each do |mind|
        mind.wired_wires.should be_instance_of(Array)
      end
    end
    it 'Mind#wires destroied with mind' do
      @base_mind.destroy
      Wire.where(base_mind_id: @base_mind.id).count.should == 0
    end
    it 'Mind#wired_wires destoied with mind' do
      @target_minds.each do |target_mind|
        target_mind.destroy
        Wire.where(target_mind_id: target_mind.id).count.should == 0
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
  describe 'Mind#resize(width:integer, height:integer)' do
    before do
      @mind = Mind.create(name: "test_mind")
      @width, @height = 111, 222
    end
    it { @mind.resize(@width, @height).should == true }
    it { @mind.resize(@width, nil).should == false }
    it { @mind.resize(nil, @height).should == false }
    it "minds.width, minds.height colum value change spacified value" do
      @mind.resize(@width, @height)
      @mind.width.should == @width
      @mind.height.should == @height
    end
  end
  describe 'Mind#connect(Mind Instance)' do
    before do
      @source_mind = Mind.create(name: "source_mind")
      @target_mind = Mind.create(name: "target_mind")
    end
    context "minds did not connect" do
      before do
        Wire.where(base_mind_id: @source_mind.id, 
                   target_mind_id: @target_mind.id).destroy_all
      end
      it { @source_mind.connect(@target_mind).should == true }
      it "create record on 'wires' table" do
        @source_mind.connect(@target_mind)
        Wire.where(base_mind_id: @source_mind.id, 
                   target_mind_id: @target_mind.id).count.should == 1
      end
    end
    context "minds has been connected" do
      before do
        wire = Wire.new
        wire.base_mind_id = @source_mind.id
        wire.target_mind_id = @target_mind.id
        wire.save
      end
      it { @source_mind.connect(@target_mind).should == false }
      it "create record on 'wires' table" do
        @source_mind.connect(@target_mind)
        Wire.where(base_mind_id: @source_mind.id, 
                   target_mind_id: @target_mind.id).count.should < 2
      end
    end
  end
  describe 'Mind#disconnect(Mind Instance)' do
    before do
      @source_mind = Mind.create(name: "source_mind")
      @target_mind = Mind.create(name: "target_mind")
      @source_mind.connect(@target_mind)
    end
    it "delete record on 'wires' table" do
      @source_mind.disconnect(@target_mind) 
      Wire.where(base_mind_id: @source_mind.id, 
                 target_mind_id: @target_mind.id).count.should == 0
    end
  end
  describe 'Mind#connected?(Mind Instance)' do
    before do
      @source_mind = Mind.create(name: "source_mind")
      @target_mind = Mind.create(name: "target_mind")
    end
    context "minds has been connected" do
      before do
        wire = Wire.new
        wire.base_mind_id = @source_mind.id
        wire.target_mind_id = @target_mind.id
        wire.save
      end
      it { @source_mind.connected?(@target_mind).should == true }
    end
    context "minds has not  been connected" do
      before do
        Wire.where(base_mind_id: @source_mind.id, 
                   target_mind_id: @target_mind.id).destroy_all
      end
      it { @source_mind.connected?(@target_mind).should == false }
    end
  end
end
