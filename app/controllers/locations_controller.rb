class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :destroy, :update]
  before_action :set_travel

  def index
    @locations = @travel.locations
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = @travel.locations.new
  end

  def edit
  end

  def create
    @location = @travel.location.new(location_params)
    if @location.save
      redirect_to travel_locations_path(@travel)
    else
      render :new
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to travel_location_path(:travel_id)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to travel_location_path(:travel_id)
  end


  private

  def location_params
    params.require(:location).permit(:name, :days)
  end
  
  def set_location
    @location = Location.find(params[:id])
  end
  
  def set_travel
    @travel = Travel.find(params[:id])
  end

end
