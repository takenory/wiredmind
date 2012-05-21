class MindsController < ApplicationController
  def move
    mind = Mind.find(params[:id])
    mind.move(params[:top], params[:left])
  end

  def connect
    @source_mind = Mind.find(params[:id])
    target_mind = Mind.find(params[:target_id])
    connected = @source_mind.connect target_mind
    render nothing: true unless connected
  end

  def disconnect
    source_mind = Mind.find(params[:id])
    target_mind = Mind.find(params[:target_id])
    source_mind.disconnect target_mind
  end

  def resize
    mind = Mind.find(params[:id])
    mind.resize(params[:width], params[:height])
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
