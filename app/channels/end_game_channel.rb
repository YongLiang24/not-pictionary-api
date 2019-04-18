class EndGameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "end_game_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
