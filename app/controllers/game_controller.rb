class GameController < ApplicationController
  def index
    @active_games = Game.where('is_active = true')

    render json: @active_games
  end

  def create
    # create a new game
  end

  def update
    @player = Player.find_or_create_by(id: join_game_params[:playerId])
    @game = Game.find(join_game_params[:id])
    @game.guesser = @player
    render json: @game
  end

  private

  def join_game_params
    params.permit(:playerId, :id)
  end
end
