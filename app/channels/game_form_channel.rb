class GameFormChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_form_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
