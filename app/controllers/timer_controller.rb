class TimerController < ApplicationController
  def create
  
  end

  private

  def timer_params
    params.permit(:currentGameId, :timerStart)
  end
end
