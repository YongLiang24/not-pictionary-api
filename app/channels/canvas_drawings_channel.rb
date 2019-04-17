class CanvasDrawingsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "canvas_drawings_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
