class CanvasController < ApplicationController
  def index
    @canvas = Canvas.all
  end

  def show
    @canvas = Canvas.find(params[:id])
  end

  def add_mind
    canvas = Canvas.find(params[:id])
    @mind = canvas.generate_mind
  end
end
