class CanvasController < ApplicationController
  def index
    @canvas = Canvas.all
  end

  def show
  end
end
