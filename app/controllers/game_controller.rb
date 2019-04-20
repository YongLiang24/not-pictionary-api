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
    @guesses = @game.rejectList
    render json: @game
  end

  def update
    @game = Game.find(join_game_params[:id])
    @guessGame = Game.find(game_form_params[:id])

    if game_form_params[:isClear]
      @guessGame.answer =''
      @guessGame.guesses.clear
      @guessGame.rejectList.clear
      @guessGame.is_won = false
      @guessGame.save
      render json: @guessGame
    end

    if guess_list_params[:isReject]
      @guessGame.is_won = true
      @guessGame.save
      render json: @guessGame
    end

    if game_form_params[:guess] || game_form_params[:answer]
      # handling both new guesses and new answers
      @guessGame.guesses << game_form_params[:guess] if game_form_params[:guess]
      @guessGame.answer = game_form_params[:answer] if game_form_params[:answer]
      # @guessGame.rejectList << game_form_params[:guessText] if game_form_params[:guessText]
      @guessGame.save
      render json: @guessGame

    elsif guess_list_params[:guessText]
        @guessGame.rejectList << guess_list_params[:guessText] if guess_list_params[:guessText]
        @guessGame.save
        render json: @guessGame

    elsif guess_list_params[:guessAction]
      # handling accept / reject guesses
      message = guess_list_params[:guessAction] == 'Reject' ? 'Wrong!' : 'Correct!'
      @guess = {
        guessIdx: guess_list_params[:guessIdx],
        message: message,
        guessText: guess_list_params[:guessText]
      }

      # ActionCable.server.broadcast "guesses_channel_#{guess_list_params[:id]}", @guess
      render json: @guess
    elsif end_game_params[:endCondition]
      # saving end game to db
      attrs = end_game_params.keep_if { |k,v| k != 'endCondition'}
      @game.update(attrs)

      head :ok
    else
      # handling joining game as guesser
      @player = Player.find(join_game_params[:playerId])
      @game.guesser = @player
      @game.save
      render json: @game
    end
  end

  private

  def end_game_params
    params.permit(:endCondition, :is_won, :id, :is_active)
  end

  def guess_list_params
    params.permit(:guessIdx, :guessAction, :id, :guessText, :type, :updateReject, :isReject)
  end

  def create_game_params
    params.permit(:playerId, :gameName)
  end

  def join_game_params
    params.permit(:playerId, :id)
  end

  def game_form_params
    params.permit(:guess, :answer, :playerId, :id, :type, :rejectList, :isClear, :guessInput, :isReject)
  end
end
