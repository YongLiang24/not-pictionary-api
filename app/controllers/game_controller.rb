class GameController < ApplicationController
  def index
    @active_games = Game.where('is_active = true')

    render json: @active_games
  end

  def create
    @drawing_player = Player.find(create_game_params[:playerId])
    @game = Game.create(
      drawer: @drawing_player,
      name: create_game_params[:gameName],
      is_active: true
    )

    render json: @game
  end

  def update
    @player = Player.find(join_game_params[:playerId])
    @game = Game.find(join_game_params[:id])
    @game.guesser = @player
    @game.save

    render json: @game
  end

  private

  def create_game_params
    params.permit(:playerId, :gameName)
  end

  def join_game_params
    params.permit(:playerId, :id)
  end
end
