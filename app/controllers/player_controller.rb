class PlayerController < ApplicationController
  def create
    # byebug
    @newPlayer = Player.find_or_create_by(player_params)

    render json: @newPlayer
  end

  private

  def player_params
    params.permit(:name)
  end
end
