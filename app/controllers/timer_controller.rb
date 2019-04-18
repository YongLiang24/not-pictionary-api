class TimerController < ApplicationController
  def create
    ActionCable.server.broadcast "timer_channel_#{timer_params[:currentGameId]}", timer_params
    head :ok
  end

  private

  def timer_params
    params.permit(:currentGameId, :timerStart)
  end
end
