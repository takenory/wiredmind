class MindsController < ApplicationController
  def move
    mind = Mind.find(params[:id])
    mind.move(params[:top], params[:left])
  end
  def destroy
    mind = Mind.find_by_id(params[:id])
    unless mind
      render nothing: true
      return
    end
    @mind_id = mind.id
    mind.destroy
  end
end
