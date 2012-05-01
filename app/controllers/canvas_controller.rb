class CanvasController < ApplicationController
  def index
    @canvas = Canvas.all
  end

  def show
    @canvas = Canvas.find(params[:id])
  end
end
