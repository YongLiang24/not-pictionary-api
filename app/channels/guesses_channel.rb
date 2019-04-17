class GuessesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "guesses_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
