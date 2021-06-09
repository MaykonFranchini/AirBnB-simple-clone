class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    @flats = policy_scope(Flat)
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create

    @flat = Flat.new(flats_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    authorize @flat
    @flat.destroy

    redirect_to flats_path
  end

  def show
    @booking = Booking.new
    authorize @flat
  end

  def edit
  end

  def update
    authorize @flat
    if @flat.update(flats_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flats_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end
end
