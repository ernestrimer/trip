class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :destroy, :update]
  before_action :set_travel

  def index
    @addresses = @travel.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = @travel.addresses.new
    render partial: "form"
  end

  def edit
    render partial: "form"

  end

  def create
    @address = @travel.address.new(address_params)
    if @topic.save
      redirect_to [@travel, @address]
    else
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to [@travel, @address]
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
    params.require(:address).permit(:title, :body)
  end

  def set_travel
    @travel = Travel.find(params[:parent_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
