class CanvasController < ApplicationController
  def index
    @canvas = Canvas.all
    render json: @canvas
  end

  def create
    @canvas = Canvas.create(canvas_drawing_params)
    render json: @canvas
  end

  def show
    @canvas=Canvas.find(params[:id])
    @canvas.save
    render json: @canvas
  end

  def update

    @canvas=Canvas.find(params[:id])

    if canvas_drawing_params[:isClear]
        @canvas.prevXArray.clear
        @canvas.prevYArray.clear
        @canvas.currXArray.clear
        @canvas.currYArray.clear
        @canvas.save
        render json: @canvas
      else

        @canvas.prevXArray = @canvas.prevXArray + canvas_drawing_params[:prevXArray]
        @canvas.prevYArray = @canvas.prevYArray + canvas_drawing_params[:prevYArray]
        @canvas.currXArray = @canvas.currXArray + canvas_drawing_params[:currXArray]
        @canvas.currYArray = @canvas.currYArray + canvas_drawing_params[:currYArray]
        @canvas.save
        render json: @canvas
    end

  end

  private

  def canvas_drawing_params
    params.permit(:currentGameId, :isClear, :prevX, :currX, :prevY, :currY, prevXArray: [], prevYArray: [], currXArray: [], currYArray: [])
  end
end
