class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  def index
    @travels = Travel.all
  end

  def show
    # @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel = @travel.save
      redirect_to travels_path
    else
      render :new
    end
  end

  def edit
    # @travel = Travel.find(params[:id])
  end

  def update
    # @travel = Travel.find(params[:id])
    if @travel.update(travel_params)
      redirect_to travels_path
    else
      render :edit
    end
  end

  def destroy
    # @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to travels_path
  end
  private
    def travel_params
      params.require(:travel).permit(:name, :start_date, :end_date)
    end

    def set_travel
      @travel = Travel.find(params[:id])
    end

end
