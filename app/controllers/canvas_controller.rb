class CanvasController < ApplicationController
  def create
    # byebug
    ActionCable.server.broadcast 'canvas_drawings_channel', canvas_drawing_params
    head :ok
  end

  private

  def canvas_drawing_params
    params.permit(:prevX, :currX, :prevY, :currY, prevXArray: [], prevYArray: [], currXArray: [], currYArray: [])
  end
end
