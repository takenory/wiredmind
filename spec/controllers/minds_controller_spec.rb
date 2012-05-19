require 'spec_helper'

describe MindsController do

  describe "POST 'move'" do
    before do
      @mind = Mind.create
      @top = 111
      @left = 222
      xhr :post, 'move', {:id => @mind.id, :top => @top, :left => @left}
    end
    it "returns http success" do
      response.should be_success
    end
    it "mind.top and mind.left should be spacified value" do
      mind = Mind.find(@mind.id)
      mind.top.should == @top
      mind.left.should == @left
    end
  end

  describe "POST 'connect'" do
    before do
      @source_mind = Mind.create
      @target_mind = Mind.create
      @source_mind.disconnect(@target_mind)
      xhr :post, 'connect', {:id => @source_mind.id, :target_id => @target_mind.id}
    end
    it { response.should be_success }
    it "source_mind connected to target_mind" do
      Wire.where(base_mind_id: @source_mind.id, target_mind_id: @target_mind.id).count.should == 1
    end
    it { response.should render_template("minds/connect") }
  end

  describe "POST 'disconnect'" do
    before do
      @source_mind = Mind.create
      @target_mind = Mind.create
      @source_mind.connect(@target_mind)
      xhr :post, 'disconnect', {:id => @source_mind.id, :target_id => @target_mind.id}
    end
    it { response.should be_success }
    it "source_mind does not connected to target_mind" do
      Wire.where(base_mind_id: @source_mind.id, target_mind_id: @target_mind.id).count.should == 0
    end
    it { response.should render_template("minds/disconnect") }
  end

  describe "POST 'resize'" do
    before do
      @mind = Mind.create
      @width = 111
      @height = 222
      xhr :post, 'resize', {:id => @mind.id, :width => @width, :height => @height}
    end
    it "returns http success" do
      response.should be_success
    end
    it "mind.width and mind.height should be spacified value" do
      mind = Mind.find(@mind.id)
      mind.width.should == @width
      mind.height.should == @height
    end
  end

  describe "DESTROY" do
    context "mind record exist" do
      before do
        @mind_id = Mind.create.id
        xhr :post, 'destroy', {:method => 'delete', :id => @mind_id, :top => @top, :left => @left}
      end
      it { response.should be_success }
      it "mind record should be deleted" do
        Mind.find_by_id(@mind_id).should be_nil
      end
      it { assigns[:mind_id].should == @mind_id }
      it { response.should render_template("minds/destroy") }
    end
    context "mind record does not exist" do
      before do
        @mind_id = 1
        Mind.delete_all(id: @mind_id)
        xhr :post, 'destroy', {:method => 'delete', :id => @mind_id, :top => @top, :left => @left}
      end
      it { response.should be_success }
      it { response.should render_template(nil) }
    end
  end
end
