class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@challenges)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def review
  #   @booking = Booking.find(params[:id])
  #   @challenge = Challenge.find(params[:challenge_id])
  # end

  private

  def booking_params
    params.require(:booking).permit(:date, :price)
  end
end
