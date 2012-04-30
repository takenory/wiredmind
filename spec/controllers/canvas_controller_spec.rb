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
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
