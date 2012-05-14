require 'spec_helper'

describe CanvasController do
  describe "GET 'index'" do
    before do
      @canvas = 5.times.collect {|i| Canvas.create(name: "canvas#{i}") }
      get 'index'
    end
    it "returns http success" do
      response.should be_success
    end
    it "assigns all canvas" do
      assigns[:canvas].should be_instance_of Array
      assigns[:canvas].should have(@canvas.count).items
      assigns[:canvas].each do |canvas|
        canvas.should be_instance_of Canvas
      end
    end
  end

  describe "GET 'show'" do
    before do
      @canvas = Canvas.create(name: 'canvas')
      #get canvas_show_path(@canvas)
      get 'show', {id: @canvas.id}
    end
    it "assigns canvas spacified request params[:id]" do
      assigns[:canvas].should be_instance_of Canvas
      assigns[:canvas].id.should == @canvas.id
    end
    it "returns http success" do
      response.should be_success
    end
  end

  describe "POST 'add_mind'" do
    before do
      @canvas = Canvas.create(name: 'canvas')
      @mind_count = @canvas.minds.count
      xhr :post, 'add_mind', {id: @canvas}
    end
    it "returns http success" do
      response.should be_success
    end
    it "Mind added to Canvas" do
      @canvas.minds.count.should == @mind_count + 1
    end
    it "assigns all canvas" do
      assigns[:mind].should be_instance_of Mind
    end
  end
end
