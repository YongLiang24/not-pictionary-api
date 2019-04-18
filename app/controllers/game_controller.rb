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
    # byebug
    if game_form_params[:guess] || game_form_params[:answer]
      # handling both new guesses and new answers
      @game.guesses << game_form_params[:guess] if game_form_params[:guess]
      @game.answer = game_form_params[:answer] if game_form_params[:answer]
      @game.save

      ActionCable.server.broadcast "game_form_channel_#{game_form_params[:id]}", game_form_params
      render json: @game
    elsif guess_list_params[:guessAction]
      # handling accept / reject guesses
      message = guess_list_params[:guessAction] == 'Reject' ? 'Wrong!' : 'Correct!'
      @guess = {
        guessIdx: guess_list_params[:guessIdx],
        message: message,
        guessText: guess_list_params[:guessText]
      }

      ActionCable.server.broadcast "guesses_channel_#{guess_list_params[:id]}", @guess
      render json: @guess
    else
      # handling joining game as guesser
      @player = Player.find(join_game_params[:playerId])
      @game.guesser = @player
      @game.save
      render json: @game
    end
  end

  private

  def guess_list_params
    params.permit(:guessIdx, :guessAction, :id, :guessText, :type)
  end

  def create_game_params
    params.permit(:playerId, :gameName)
  end

  def join_game_params
    params.permit(:playerId, :id)
  end

  def game_form_params
    params.permit(:guess, :answer, :playerId, :id, :type)
  end
end
