class CanvasDrawingsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "canvas_drawings_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
