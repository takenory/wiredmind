class MindsController < ApplicationController
  def move
    mind = Mind.find(params[:id])
    mind.move(params[:top], params[:left])
  end
end
