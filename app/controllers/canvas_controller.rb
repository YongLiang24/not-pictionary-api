class CanvasController < ApplicationController
  def create
    ActionCable.server.broadcast "canvas_drawings_channel_#{canvas_drawing_params[:currentGameId]}", canvas_drawing_params
    head :ok
  end

  private

  def canvas_drawing_params
    params.permit(:currentGameId, :prevX, :currX, :prevY, :currY, prevXArray: [], prevYArray: [], currXArray: [], currYArray: [])
  end
end
