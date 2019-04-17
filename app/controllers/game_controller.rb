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
      is_active: true,
      guesses: []
    )

    render json: @game
  end

  def show
    @game=Game.find(params[:id])
    @guesses= @game.guesses

    render json: @guesses

  end

  def update

    @game = Game.find(join_game_params[:id])

    if  game_form_params[:guess] || game_form_params[:answer]
      @game.guesses << game_form_params[:guess] if game_form_params[:guess]
      @game.answer = game_form_params[:answer] if game_form_params[:answer]
      @game.save
    else
      @player = Player.find(join_game_params[:playerId])
      @game.guesser = @player
      @game.save
    end

    # byebug
    render json: @game
  end

  private

  def create_game_params
    params.permit(:playerId, :gameName)
  end

  def join_game_params
    params.permit(:playerId, :id)
  end

  def game_form_params
    params.permit(:guess, :answer, :playerId)
  end
end
