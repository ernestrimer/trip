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
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @location = @travel.location.new(location_params)
    if @topic.save
      redirect_to [@travel, @location]
    else
      render :new
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to [@travel, @location]
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to travel_locations_path(@travel)
  end



  private

  def location_params
    params.require(:location).permit(:title, :body)
  end

  def set_travel
    @travel = Travel.find(params[:parent_id])
  end

  def set_location
    @location = Location.find(params[:id])
  end

end

end
