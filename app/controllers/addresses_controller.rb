class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :destroy, :update]
  before_action :set_location
  

  def index
    @addresses = @location.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = @location.addresses.new
  end

  def edit
  end

  def create
    @address = @location.address.new(address_params)
    if @address.save
      redirect_to location_address_path
    else
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to location_address_path
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to travel_addresses_path(@travel)
  end


private

  def address_params
    params.require(:address).permit(:street, :state, :city, :zip)
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def set_address
    @address = Address.find(params[:location_id])
  end
end
