require 'spec_helper'

describe MindsController do

  describe "GET 'move'" do
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

end
